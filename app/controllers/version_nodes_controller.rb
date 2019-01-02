# Controller for a single node
class VersionNodesController < ApplicationController
  layout 'modal', only: [:edit]

  before_action :find_version_node, only: [:edit, :update]
  
  def edit; end

  def update
    version_node_params = params.require(:version_node).permit!
    
    if @version_node.update(version_node_params)
      flash[:success] = 'Version node "' + @version_node.id.to_s + '" successfully updated.'
    else
      flash[:error] = 'There was an error updating the subject information'
    end 

    redirect_to show_version_nodes_version_path(id: @version_node.version_id)
  end 

  private

  def find_version_node
    @version_node = VersionNode.find(params[:id])
  end 
end
