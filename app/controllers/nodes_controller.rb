# Controller for a single node
class NodesController < ApplicationController
  def comment
    puts params
    @node = Node.find_by(id: params[:id].to_i)

    @node.comment = params[:comment]
    @node.save
  end
end
