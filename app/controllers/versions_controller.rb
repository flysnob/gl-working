# Represents a single version
class VersionsController < ApplicationController
  layout 'modal', only: [:show, :delete_modal, :new]

  before_action :find_version, only: [:show, :edit, :destroy, :delete_modal, :update, :show_version_nodes]

  def index
    @versions = Version.all
  end

  def new
    @version = version.new
  end

  def show; end

  def show_version_nodes; end

  def edit; end

  def update
    version_params = params.require(:version).permit!

    if @version.update(version_params)
      flash[:success] = 'version "' + @version.name + '" successfully updated.'
    else
      flash[:error] = 'There was an error updating the version information'
    end

    redirect_to versions_path
  end

  def destroy
    @version.destroy if @version

    redirect_to versions_path
  end

  def delete_modal; end

  def create
    version_params = params[:version]
    version_params[:created_by] = current_user

    @version = build_version(version_params)

    redirect_to versions_path
  end

  def build_version(version_params)
    version.create(
      module_code: version_params[:module_code],
      version_number: version_params[:version_number],
      effective_date: version_params[:effective_date],
      expiration_date: version_params[:expiration_date],
      status: version_params[:status],
      json: version_params[:json],
      subject: find_subject(version_params[:subject]),
    )
  end

  private

  def find_version
    @version = Version.find_by(id: params[:id])
  end
end
