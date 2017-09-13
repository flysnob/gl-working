# Responses are a projects set of responses to project questions
class ResponsesController < ApplicationController
  before_action :make_legger

  def new
    @response = Response.new
  end

  def create
    @logger.info("params[:response]: #{params[:response]}")
    response_params = params[:response]
    response_params[:created_by] = current_user

    build_response(response_params)

    redirect_to work_projects_path(response_params[:project])
  end

  def build_response(resppnse_params)
    Response.create(
      project_question: response_params[:project_question],
      project: response_params[:project],
      answer: response_params[:answer],
      sequence: response_params[:sequence],
      comment: response_params[:comment]
    )
  end

  def find_response
    @response = Response.find_by(id: params[:id])
  end

  def make_logger
    @logger = Logger.new('log/responses_controller')
  end
end
