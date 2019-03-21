# Controller for a single node
class VersionNodesController < ApplicationController
  layout 'modal', only: [:edit, :new]

  before_action :find_version_node, only: [:edit, :update]
  before_action :find_version, only: [:edit, :new]
  
  def edit; end

  def new
    @version_node = VersionNode.new
  end

  def update
    version_node_params = params.require(:version_node).permit!
    
    if @version_node.update(version_node_params)
      flash[:success] = 'Version node "' + @version_node.id.to_s + '" successfully updated.'
    else
      flash[:error] = 'There was an error updating the subject information'
    end 

    redirect_to show_version_nodes_version_path(id: @version_node.version_id)
  end 

  def create
    version_node_params = params[:version_node]
    version_node_params[:created_by] = current_user

    @version_node = build_version_node(version_node_params)

    redirect_to :back
  end

  private

  def build_version_node(version_node_params)
    VersionNode.create(
      version_id: version_node_params[:version_id],
      question_id: version_node_params[:question_id],
      kind: version_node_params[:kind],
      response_1: version_node_params[:response_1],
      response_2: version_node_params[:response_2],
      response_3: version_node_params[:response_3],
      response_fatal: version_node_params[:response_fatal],
      target_1: version_node_params[:target_1],
      target_2: version_node_params[:target_2],
      target_3: version_node_params[:target_3],
      target_fatal: version_node_params[:target_fatal],
      return_node: version_node_params[:return_node],
      decision_node: version_node_params[:decision_node],
      meets_response: version_node_params[:meets_response],
      boolean: version_node_params[:boolean],
      target_module: version_node_params[:target_module],
      return: version_node_params[:return],
      sort: version_node_params[:sort]
    )
  end


  def find_version_node
    @version_node = VersionNode.where(id: params[:id]).includes(:question).first
  end

  def find_version
    @version = Version.find(params[:version_id])
  end
end
