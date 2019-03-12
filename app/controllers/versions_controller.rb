# Represents a single version
class VersionsController < ApplicationController
  layout 'modal', only: [:show, :delete_modal, :new, :edit]

  before_action :find_version, only: [:show, :edit, :destroy, :delete_modal, :update, :show_version_nodes, :copy]
  before_action :clear_flash

  def index
    @versions = Version.all
  end

  def new
    @version = Version.new
  end

  def show; end

  def show_version_nodes
    @version_nodes = VersionNode.where(version_id: @version.id).order(:id)
  end

  def edit; end

  def copy
    @dup = @version.dup
     @dup.effective_date = Date.current
    @dup.version_number = 'Copy of version ' + @version.version_number
    @dup.save

    ActiveRecord::Base.transaction do
      VersionNode.where(version: @version).each do |node|
        node_dup = node.dup
        node_dup.version = @dup
        node_dup.save
      end

      if @dup.errors.empty?
        flash[:success] = "Version #{@version.subject.name} v.#{@version.version_number} successfully copied to #{@dup.subject.name} v.#{@dup.version_number}."
      else
        flash[:error] = @dupe.errors.full_messages.to_sentence
        flash.keep
      end

      redirect_to versions_path
    end
  end

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

  def clear_flash
    flash.delete(:alert)
    flash.clear
  end
end
