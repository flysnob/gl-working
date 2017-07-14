# Projects are a set of questions and reponses
class ProjectsController < ApplicationController
  def index
    @projects = Project.where(user: current_user)
  end

  def new
    @project = Project.new
  end

  def create
    project_params = params[:project]
    project_params[:created_by] = current_user

    @project = build_project(project_params)

    add_project_errors_to_flash

    redirect_to request.referer || projects_path
  end

  def build_project(project_params)
    Project.create(
      title: project_params.title,
      description: project_params.description,
      entity_name: project_params.entity_name,
      user: current_user
    )
  end
end
