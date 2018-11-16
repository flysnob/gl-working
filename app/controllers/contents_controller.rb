# Controller for page content
class ContentsController < ApplicationController
  layout 'modal', only: [:show, :edit, :new, :delete_modal]

  before_action :find_content, only: [:show, :edit, :destroy, :delete_modal, :update]

  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def show; end

  def edit; end

  def update
    content_params = params.require(:content).permit!

    if @content.update(content_params)
      flash[:success] = 'Content "' + @content.title + '" successfully updated.'
    else
      flash[:error] = 'There was an error updating the content'
    end

    redirect_to contents_path
  end

  def destroy
    @content.destroy if @content

    redirect_to contents_path
  end

  def delete_modal; end

  def create
    content_params = params[:content]
    content_params[:created_by] = current_user

    @content = build_content(content_params)

    redirect_to contents_path
  end

  def build_content(content_params)
    Content.create(
      title: content_params[:title],
      content: content_params[:content],
      effective: Date.current
    )
  end

  private

  def find_content
    @content = Content.find_by(id: params[:id])
  end
end
