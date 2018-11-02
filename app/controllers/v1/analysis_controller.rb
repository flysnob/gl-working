# Projects are a set of questions and reponses
module V1
  class AnalysisController < ApplicationController
    layout 'modal', only: [:show, :edit, :delete_modal, :new]

    before_action :find_project, only: [:show, :edit, :destroy, :delete_modal, :work, :update, :previous]
    before_action :find_last_node, only: [:work]
    before_action :update_node

    def work
      @project_params = params.permit(:project, :index, :response_value, :node_id, :question_id)

      fetch_nodes

      @response_nodes.sort_by! { |n| n[:index] }

      raise Exception.new('No nodes for this project.') if @project_nodes.length.zero?

      @length = @response_nodes.length

      if @length.zero?
        # first node in the project
        @next_node = @project_nodes.select { |n| n.question_code == "#{@project.version.module_code}-1" }.first
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
      fetch_nodes
      @next_node = @project_nodes.select { |q| q[:question_code] == params[:node_code] }.first
      @current_node = @response_nodes.select { |q| q[:question_code] == params[:current_node_code] }.first
      @index = @next_node.index
    end

    def fetch_nodes
      @project_nodes = Node.includes(:question)
                           .where(project_id: @project.id)
                           .to_a

      @response_nodes = Node.includes(:question)
                            .where(project_id: @project.id)
                            .where('response_value IS NOT NULL')
                            .order(index: :asc)
                            .to_a
    end
    
    def make_next_node
      returns = Return.where(project_id: @project.id)

      return_node_code = returns.length.zero? ? nil : returns.last.return_node_code

      @next_node = V1::ResponseProcessor.perform(@last_node, @project_nodes, return_node_code)

      if @next_node.kind == 'd'
        # we have a new last node now
        @response_nodes = Node.where(project_id: @project.id)
                              .where('response_value IS NOT NULL')
                              .order(index: :asc)
                              .to_a
        # if @next_node already has an index (from page reload or coming from projects index page)
        @index = @next_node.index.present? ? @next_node.index : @response_nodes.length + 1
        @next_node.update(
          index: @index,
          return_node: params[:return_node]
        )
        @last_node = @next_node
        make_next_node
      elsif %w[ cf cp]include?(@next_node.kind)
        # we have a new last node now
        @response_nodes = Node.where(project_id: @project.id)
                              .where('response_value IS NOT NULL')
                              .order(index: :asc)
                              .to_a
        # if @next_node already has an index (from page reload or coming from projects index page)
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
                              .order(index: :asc)
                              .to_a
        @index = @response_nodes.length + 1
      end
    end

    def update_node
      # update with return node if not na. when/how is it cleared?
      return if params[:response_value].blank?

      @last_node.update(
        response_value: params[:response_value],
        display_value: params[:response_value],
        response_text: params[:commit],
        target_node: params[:target_node],
        index: params[:index].to_f.round(0),
        comment: params[:comment]
      )
      #update return_node if we're in a submodule
      @last_node.update(return_node: params[:return_node]) unless @last_node.module_code == @project.version.module_code
      @last_node.save
      @last_node.reload
    end

    # @TODO: Fix this
    def drop_subsequent_nodes
      # Only need to evalluate this if the index of the last node is less than @response_nodes.last.index.
      # This avoids running this when the 
      #   last node is a decision/conclusion node or
      #   last response_nodes' index is nil or 
      #   last_nodes index is not less than response_nodes' last index
      return if %w[cf cp d]include?(@last_node.kind) || @response_nodes.last.index.nil? || @last_node.index >= @response_nodes.last.index
      # if the node already has an answer, and it has now changed, drop all subsequent nodes
      if @last_node.response_value.present? && @last_node.response_value != params[:commit]
        @response_nodes.each do |n|
          next unless n.index > @last_node.index
          n.response_value = nil
          n.display_value = nil
          n.response_text = nil
          n.target_node = nil
          n.index = nil
          n.return_node = nil
          n.save
          @response_nodes - [n]
          # destroy any return whose response_node has been reset
          r = Return.find_by(question_code: n.question_code)
          if r
            r.destroy
          end
        end
        @response_nodes = Node.where(project_id: @project.id)
                              .where('response_value IS NOT NULL')
                              .to_a
      end
    end
  end
end
