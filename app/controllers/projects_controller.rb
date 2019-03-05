# Projects are a set of questions and reponses
class ProjectsController < ApplicationController
  layout 'modal', only: [:show, :edit, :delete_modal, :new]

  before_action :find_project, only: [:show, :edit, :destroy, :delete_modal, :work, :update, :previous, :copy]
  before_action :find_last_node, only: [:work]
  before_action :clear_flash
  before_action :update_node
  before_action :find_setting
  before_action :set_params, only: [:work, :previous]

  def index
    @projects = Project.where(user: current_user)
  end

  def new
    @project = Project.new
  end

  def show; end

  def edit; end

  def copy
    @dup = @project.dup
		@dup.name = "Copy of #{@project.name}"
		@dup.save
    
    ActiveRecord::Base.transaction do
      Node.where(project: @project).each do |node|
        node_dup = node.dup
        node_dup.project = @dup
        node_dup.save
      end

      if @dup.errors.empty?
        flash[:success] = "Project #{@project.name} successfully copied to #{@dup.name}."
      else
        flash[:error] = @dupe.errors.full_messages.to_sentence
        flash.keep
      end

      redirect_to projects_path
		end
  end

  def update
    project_params = params.require(:project).permit!

    project_params[:subject] = Subject.find(project_params[:subject])

    if @project.update(project_params)
      flash[:success] = 'Project "' + @project.name + '" successfully updated.'
    else
      flash[:error] = 'There was an error updating the project information'
    end

    redirect_to projects_path
  end

  def work
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
    @subject_name = @next_node.module_code != @project.subject.module_code ? " Subtopic: #{Subject.find_by(module_code: @next_node.module_code).name}" : ''
    @current_node = @response_nodes.select { |q| q[:question_code] == params[:current_node_code] }.first
    @index = @next_node.index
  end

  def set_previous
    @current_node = @response_nodes.select { |q| q.index == @response_nodes.length - 1 }.first
    @index = @next_node.index

    render 'previous'
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
    if params[:comment_save] == 'true'
      update_comment
    else
      @next_node = ResponseProcessor.perform(@last_node, @project_nodes)

      if %w[cf cp d].include?(@next_node.kind) 
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

        # generate the next node if we're skipping the decision/conclusion nodes
        make_next_node
      # Need to deal with pause here since next node is the d node and does not have any data yet
      elsif %w[r].include?(@next_node.kind)
        @index = @next_node.index.present? ? @next_node.index : @response_nodes.length + 1
        @next_node.update(
          index: @index
        )
      else
        # have we changed a previous answer?
        drop_subsequent_nodes

        # we may have a new response node set
        @response_nodes = Node.where(project_id: @project.id)
                              .where('response_value IS NOT NULL')
                              .order(index: :asc)
                              .to_a

        @index = @response_nodes.length + 1

        if %w[cf cp d].include?(@last_node.kind)
          if @last_node.display_value == '1' && @project_params[:previous].nil?
            flash[:notice] = (@last_node.question.conclusion_1 || @last_node.question.content)
          elsif @last_node.display_value == '2' && @project_params[:previous].nil?
            flash[:notice] = (@last_node.question.conclusion_2 || @last_node.question.content)
          end
        end
      end
    end
    @subject_name = @next_node.module_code != @project.subject.module_code ? " Subtopic: #{Subject.find_by(module_code: @next_node.module_code).name}" : ''
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
      NodeGenerator::build_nodes(@project, project_params)

      if @project.errors.empty?
        flash[:success] = "Project #{@project.name} successfully created."
      else
        flash[:error] = @project.errors.full_messages.to_sentence
        flash.keep
      end

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

  def clear_flash
    flash.delete(:alert)
    flash.clear
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

  def find_project
    @project = Project.find_by(id: params[:id])
  end
  
  def find_setting
    @setting = Setting.find_by(id: current_user.setting.id)
  end
  
  def find_last_node
    @last_node = if params[:node_id].present?
                   Node.find(params[:node_id])
                 else
                   nil
                 end
  end

  def update_node
    # update with return node if not na. when/how is it cleared?
    return if params[:response_value].blank?


    @returns = Return.where(project_id: @last_node.project_id)

    @target_node = params[:target_node]

    if @returns.length.nonzero? && @last_node.response_fatal == params[:commit]
      @target_node = @last_node.target_fatal
    end

    if params[:response_value] != @last_node.response_value
      flash[:alert] = 'You have changed a previous response. Your response has been updated and all subsequent responeses have been reset.' if
        @last_node.index
      
      @last_node.update_attributes(
        response_value: params[:response_value],
        display_value: params[:response_value],
        response_text: params[:commit],
        target_node: @target_node,
        index: params[:index].to_f.round(0),
        comment: params[:comment]
      )
      #update return_node if we're in a submodule
      @last_node.update_attributes(return_node: params[:return_node]) unless @last_node.module_code == @project.version.module_code
    end
  end

  def update_comment  
    @last_node.update_attributes(
      comment: params[:comment]
    )

    @next_node = @last_node

    @current_node = @last_node
    @index = @next_node.index

    flash[:notice] = 'Comment updated.'

    render 'previous'
  end

  def drop_subsequent_nodes
    # Only need to evalluate this if the index of the last node is less than @response_nodes.last.index.
    # This avoids running this when the 
    #   last node is a decision/conclusion node or
    #   last response_nodes' index is nil or 
    #   last_nodes index is not less than response_nodes' last index
    return if %w[cf cp d].include?(@last_node.kind) || @response_nodes.last.index.nil? || @last_node.index >= @response_nodes.last.index
    # if the node already has an answer, and it has now changed, drop all subsequent nodes
    if @last_node.response_value.present? && @last_node.response_value != params[:commit]
      @response_nodes.each do |n|
        next unless n.index > @last_node.index || n.index.nil?
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
                            .order(index: :asc)
                            .to_a
    end

    # set last return status if not 0
    last_return = Return.last
    if last_return && last_return != 0
      last_return.status = 0
      last_return.save
    end
  end

  def set_params
    @project_params = params.permit(:project, :index, :response_value, :node_id, :question_id, :target_node,
                                    :return_node, :commit, :comment, :id, :previous, :comment_save, :node_code)
  end
end
