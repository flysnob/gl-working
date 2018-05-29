# Projects are a set of questions and reponses
class ProjectsController < ApplicationController
  layout 'modal', only: [:show, :edit, :delete_modal, :new]

  before_action :make_logger
  before_action :find_project, only: [:show, :edit, :destroy, :delete_modal, :work, :update, :previous]
  before_action :find_last_node, only: [:work]
  before_action :update_node

  include DrawingHelpers

  def index
    @projects = Project.where(user: current_user)
  end

  def new
    @project = Project.new
  end

  def show; end

  def edit; end

  def update
    project_params = params.require(:project).permit!
    
    if @project.update(project_params)
      flash[:success] = 'Project "' + @project.name + '" successfully updated.'
    else
      flash[:error] = 'There was an error updating the project information'
    end

    redirect_to projects_path
  end

  def work
    @project_params = params.permit(:project, :index, :response_value, :node_id, :question_id)

    @project_nodes = Node.includes(:question)
                         .where(project_id: @project.id)
                         .to_a

    @response_nodes = Node.includes(:question)
                          .where(project_id: @project.id)
                          .where('response_value IS NOT NULL')
                          .to_a

    raise Exception.new('No nodes for this project.') if @project_nodes.length.zero?

    @length = @response_nodes.length

    if @length.zero?
      # first node in the project
      @next_node = @project_nodes.first
      @index = 1 
    elsif @last_node.nil?
      # coming from project index with existing nodes
      @last_node = @response_nodes.last
      make_next_node
    else
      # next node in the project
      make_next_node
    end
  end

  def previous
    @project_nodes = Node.where(project_id: @project.id).to_a

    @response_nodes = Node.includes(:question)
                          .where(project_id: @project.id)
                          .where('response_value IS NOT NULL')
                          .to_a

    @next_node = @project_nodes.select { |q| q[:question_code] == params[:node_code] }.first
    @current_node = @project_nodes.select { |q| q[:question_code] == params[:current_node_code] }.first
    @index = @next_node.index
  end
  
  def make_next_node
    returns = Return.where(project_id: @project.id)

    return_node_code = returns.length.zero? ? nil : returns.last.return_node_code

    @next_node = ResponseProcessor.perform(@last_node, @project_nodes, return_node_code)

    if @next_node.kind == 'd'
      # we have a new last node now
      @response_nodes = Node.where(project_id: @project.id)
                            .where('response_value IS NOT NULL')
                            .to_a
      # if @next_node already has an index (from page reload or coming from index)
      @index = @next_node.index.present? ? @next_node.index : @response_nodes.length + 1
      @next_node.update(
        index: @index,
        return_node: params[:return_node]
      )
      @last_node = @next_node
      make_next_node
    else
      # have we changed a previous answer?
      drop_subsequent_nodes

      @response_nodes = Node.where(project_id: @project.id)
                            .where('response_value IS NOT NULL')
                            .to_a
      @index = @response_nodes.length + 1
    end
  end

  def destroy
    @project.destroy if @project

    redirect_to projects_path
  end

  def delete_modal; end

  def create
    project_params = params[:project]
    project_params[:created_by] = current_user

    @project = build_project(project_params)

    ActiveRecord::Base.transaction do
      build_nodes(project_params)

      flash[:error] = @project.errors.full_messages.to_sentence unless @project.errors.empty?
      flash.keep

      redirect_to projects_path
    end
  end

  def build_project(project_params)
    Project.create(
      name: project_params[:name],
      description: project_params[:description],
      subject: find_subject(project_params[:subject]),
      version: select_core_version(params),
      date: project_params[:date],
      user: current_user
    )
  end

  private

  def find_subject(subject_id)
    @subject = Subject.find(subject_id)
  end

  def create_node_set
    @nodes.each do |n|
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
        target_1: n[:version]['target_1'],
        target_2: n[:version]['target_2'],
        target_3: n[:version]['target_3'],
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

  # core project questions
  def build_nodes(project_params)
    @nodes = []

    @project.version.version_nodes.each do |n|
      question = Question.find(n.question_id)

      @nodes.push({ question: question, version: n })

      if n.target_module.present?
        build_module_version_nodes(n)
      end
    end

    create_node_set
  end

  # submodule questions for analyze buttons
  def build_module_version_nodes(core_node)
    module_version = select_module_version(core_node)

    module_version.version_nodes.each do |n|
      question = Question.find(n.question_id)

      @nodes.push({ question: question, version: n })
    end
  end

  def select_core_version(params)
    versions = if params[:date].nil?
                 Version.where(subject: @subject)
                        .where('expiration_date IS NULL')
               else
                 Version.where(subject: @subject)
                        .where('effective_date <= ? AND expiration_date IS NULL OR expiration_date < ?', @project[:date], @project[:date])
               end
    raise Exception.new("No version available for subject #{@subject.name}.") if versions.length.zero?
    @core_version = versions.first
    @core_version
  end

  def select_module_version(v)
    versions = if @project[:date].nil?
                 Version.where(module_code: v.target_module)
                        .where('expiration_date IS NULL')

               else
                 Version.where(module_code: v.target_module)
                        .where('effective_date <= ? AND expiration_date IS NULL OR expiration_date < ?', @project[:date], @project[:date])
               end
    raise Exception.new("No version available for module code #{v['target_module']}.") if versions.length.zero?
    versions.first
  end

  def find_project
    @project = Project.find_by(id: params[:id])
  end
  
  def find_last_node
    @last_node = if params[:node_id].present?
                   Node.find(params[:node_id])
                 else
                   nil
                 end

    @logger.info("@last_node: #{@last_node}")
  end

  def update_node
    # update with return node if not na. when/how is it cleared?
    return if params[:response_value].nil?

    @last_node.update(
      response_value: params[:response_value],
      response_text: params[:commit],
      target_node: params[:target_node],
      index: params[:index].to_f.round(0),
      comment: params[:comment]
    )
    #update return_node if we're in a submodule
    @last_node.update(return_node: params[:return_node]) unless @last_node.module_code == @project.version.module_code
    @last_node.save
    @last_node.reload
    @logger.info("@last_node[:target_node]: #{@last_node[:target_node]}")
    @logger.info("@last_node[:index]: #{@last_node[:index]}")
  end

  def make_logger
    @logger = Logger.new('log/projects_controller.log')
  end

  # @TODO: Fix this
  def drop_subsequent_nodes
    # Only need to valaluate this if the index of the last node is less than @response_nodes.last.index.
    # This avoids running this when the last node is a decision node
    return if @last_node.kind == 'd' || @response_nodes.last.index.nil? || @last_node.index >= @response_nodes.last.index
    # if the node already has an answer, and it has now changed, drop all subsequent nodes
    # @TODO: uses unix so if dropped node is 10, it doesn't drop node 2
    if @last_node.response_value.present? && @last_node.response_value != params[:commit]
      @response_nodes.each do |n|
        if n.index > @last_node.index
          n.response_value = nil
          n.response_text = nil
          n.target_node = nil
          n.index = nil
          n.return_node = nil
          n.save
          @response_nodes - [n]
        end
        # destroy any return whose response_node has been reset
        r = Return.find_by(node_index: n.question_code)
        if r
          r.destory
        end
      end
      @response_nodes = Node.where(project_id: @project.id)
                            .where('response_value IS NOT NULL')
                            .to_a
    end
  end
end
