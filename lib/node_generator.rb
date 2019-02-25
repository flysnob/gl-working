class NodeGenerator
  class << self
    # core project questions
    def build_nodes(project, project_params)
      @project = project
      @nodes = []
      @modules = {}

      @project.version.version_nodes.each do |n|
        question = Question.find(n.question_id)
        @modules[question.module_code] = true unless @modules[question.module_code]

        @nodes.push({ question: question, version: n })

        if n.target_module.present? && @modules[n.target_module].nil?
          @modules[n.target_module] = true
          build_module_version_nodes(n.target_module)
        end
      end

      create_node_set(@nodes)
    end

    def select_module_version(target_module)
      versions = if @project[:date].nil?
                   Version.where(module_code: target_module)
                          .where('expiration_date IS NULL')

                 else
                   Version.where(module_code: target_module)
                          .where('effective_date <= ? AND expiration_date IS NULL OR expiration_date < ?', @project[:date], @project[:date])
                 end
      raise Exception.new("No version available for module code #{v['target_module']}.") if versions.length.zero?
      versions.first
    end

    # submodule questions for analyze buttons
    def build_module_version_nodes(target_module)
      module_version = select_module_version(target_module)

      module_version.version_nodes.each do |n|
        question = Question.find(n.question_id)

        @nodes.push({ question: question, version: n })
      end
    end

    def build_additional_nodes(project_id, target_module)
      @project = Project.find(project_id)
      new_nodes = []
      module_version = select_module_version(target_module)

      module_version.version_nodes.each do |n|
        question = Question.find(n.question_id)

        new_nodes.push({ question: question, version: n })
      end

      create_node_set(new_nodes)

      @project.nodes
    end

    def create_node_set(nodes)
      nodes.each do |n|
        node_hash = {
          project: @project,
          question: n[:question],
          kind: n[:question][:kind],
          module_code: n[:question][:module_code],
          question_code: n[:question][:question_code],
          conclusion_1: n[:question][:conclusion_1],
          conclusion_2: n[:question][:conclusion_2],
          conclusion_3: n[:question][:conclusion_3],
          meets_response: n[:version]['meets_response'],
          response_1: n[:version]['response_1'],
          response_2: n[:version]['response_2'],
          response_3: n[:version]['response_3'],
          response_fatal: n[:version]['response_fatal'],
          target_1: n[:version]['target_1'],
          target_2: n[:version]['target_2'],
          target_3: n[:version]['target_3'],
          target_fatal: n[:version]['target_fatal'],
          target_module: n[:version]['target_module'],
          return_node: n[:version]['return_node'],
          decision_node: n[:version]['decision_node'],
          boolean: n[:version]['boolean'],
          return: n[:version]['return']
        }
        Node.create(
          node_hash
        )
      end
    end
  end
end
