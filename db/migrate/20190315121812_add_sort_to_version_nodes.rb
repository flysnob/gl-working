class AddSortToVersionNodes < ActiveRecord::Migration[5.0]
  def change
    add_column :version_nodes, :sort, :integer
    add_column :version_nodes, :display, :boolean, default: true 
  end
end
