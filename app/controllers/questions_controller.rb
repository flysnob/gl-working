# Represents a single question
class QuestionsController < ApplicationController
  layout 'modal', only: [:show, :edit, :delete_modal, :new]

  before_action :find_question, only: [:show, :edit, :destroy, :delete_modal, :update]
  before_action :clear_flash

  def index
    @questions = Question.all.order(:module_code, 'sort::integer')
  end

  def new
    @question = Question.new
  end

  def show; end

  def edit; end

  def update
    question_params = params.require(:question).permit!
    question_params[:subject] = Subject.find(question_params[:subject])
    
    if @question.update(question_params)
      flash[:success] = 'Question "' + @question.question_code + '" successfully updated.'
    else
      flash[:error] = 'There was an error updating the question information'
    end

    redirect_to request.referrer
  end

  def destroy
    @question.destroy if @question

    redirect_to questions_path
  end

  def delete_modal; end

  def create
    question_params = params[:question]
    question_params[:created_by] = current_user

    ActiveRecord::Base.transaction do
      @question = build_question(question_params)

      flash[:error] = @question.errors.full_messages.to_sentence unless @question.errors.empty?
      flash.keep

      redirect_to :back
    end
  end

  def build_question(question_params)
    Question.create(
      module_code: question_params[:module_code],
      question_code: question_params[:question_code],
      content: question_params[:content],
      sort: question_params[:sort],
      kind: question_params[:kind],
      summary: question_params[:summary],
      report_summary: question_params[:report_summary],
      report_content: question_params[:report_content],
      subject: Subject.find(question_params[:subject]),
      asc: question_params[:asc],
      examples: question_params[:examples],
      faq: question_params[:faq],
      help: question_params[:help],
      articles: question_params[:articles],
      conclusion_1: question_params[:conclusion_1],
      conclusion_2: question_params[:conclusion_2],
      conclusion_3: question_params[:conclusion_3]
    )
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def clear_flash
    flash.delete(:alert)
    flash.clear
  end

end
