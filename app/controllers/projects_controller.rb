# Projects are a set of questions and reponses
class ProjectsController < ApplicationController
  layout 'modal', only: [:show, :edit, :delete_modal, :new]

  before_action :find_project, only: [:show, :edit, :delete, :delete_modal, :work, :update]

  def index
    @projects = Project.where(user: current_user)
  end

  def new
    @project = Project.new
  end

  def show; end

  def edit; end

  def update
    project_params = params.require(:project).permit(:name, :description)
    
    if @project.update(project_params)
      flash[:succes] = 'Project "' + @project.name + '" successfully updated.'
    else
      flash[:error] = 'There was an error updating the project information'
    end

    redirect_to projects_path
  end

  def work
    @project_questions = ProjectQuestion.where(project: @project)
    @project_responses = Response.where(project_id: @project.id)

    raise Exception.new('No project questions for this project.') if @project_questions.count.zero?

    if @project_responses.count.zero?
      @next_question = @project_questions.first
      @index = 1 
    else
      @next_question = ProcessQuestion.perform(@responses, @project_questions)
      @index = @question.index
    end
  end
  
  def delete; end

  def delete_modal; end

  def create
    puts params[:project]
    project_params = params[:project]
    project_params[:created_by] = current_user
    project_params[:version] = params[:version]

    @project = build_project(project_params)

    build_project_questions(project_params)

    flash[:error] = @project.errors.full_messages.to_sentence unless @project.errors.empty?
    flash.keep

    redirect_to projects_path
  end

  def build_project(project_params)
    puts project_params
    Project.create(
      name: project_params[:name],
      description: project_params[:description],
      subject: Subject.find(project_params[:subject]),
      version: Version.find(project_params[:version]),
      date: project_params[:date],
      user: current_user
    )
  end

  private

  def create_question_set
    @project_questions.each do |q|
      ProjectQuestion.create(
        project: @project,
        question: q
      )
    end
  end

  # core project questions
  def build_project_questions(project_params)
    @project_questions = []
    
    core_version = Version.find(project_params[:version])

    json = JSON.parse(core_version.json)
    
    json.each do |v|
      question = Question.find_by(question_code: v['question_code'])

      @project_questions.push(question)
    end

    json.each do |v|
      if v['target_3'].present?
        build_module_version_questions(v)
      end
    end

    create_question_set
  end

  # submodule questions for analyze buttons
  def build_module_version_questions(v)
    module_version = select_module_version(v)

    json = JSON.parse(module_version.json)
    
    json.each do |v|
      question = Question.find_by(question_code: v['question_code'])

      @project_questions.push(question)
    end
  end

  def select_module_version(v)
    if @project[:date].nil?
      versions = Version.where(module_code: v['target_3'])

      raise Exception.new('No versions available for this subject.') if versions.count.zero?

      versions.first
    else
      Version.where(module_code: v['target_3'])
             .where('effective_date <= ? AND expiration_date IS NULL OR expiration_date < ?', @project[:date], @project[:date])
    end
  end

  def find_project
    @project = Project.find_by(id: params[:id])
  end
end
