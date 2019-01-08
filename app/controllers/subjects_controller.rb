# Subjects are different areas of GAAP
class SubjectsController < ApplicationController
  layout 'modal', only: [:show, :delete_modal, :new, :edit, :description, :description_modal]

  before_action :find_subject, only: [:show, :edit, :destroy, :delete_modal, :update, :description]

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def show; end

  def edit; end

  def description; end

  def description_modal
    @subject = Subject.find(params[:subject_id])
  end

  def update
    subject_params = params.require(:subject).permit!

    if @subject.update(subject_params)
      flash[:success] = 'Subject "' + @subject.name + '" successfully updated.'
    else
      flash[:error] = 'There was an error updating the subject information'
    end

    redirect_to subjects_path
  end

  def destroy
    @subject.destroy if @subject

    redirect_to subjects_path
  end

  def delete_modal; end

  def create
    subject_params = params[:subject]
    subject_params[:created_by] = current_user

    @subject = build_subject(subject_params)

    redirect_to subjects_path
  end

  def build_subject(subject_params)
    Subject.create(
      name: subject_params[:name],
      description: subject_params[:description],
      display: subject_params[:display] == 'true'
    )
  end

  def versions
    @versions = Version.where(subject_id: params[:id])
                       .order('effective_date DESC')

    respond_to do |format|
      format.json { render json: @versions }
    end
  end

  private

  def find_subject
    @subject = Subject.find_by(id: params[:id])
  end
end
