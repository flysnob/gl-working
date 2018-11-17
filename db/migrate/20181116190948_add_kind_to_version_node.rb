class AddKindToVersionNode < ActiveRecord::Migration[5.0]
  def change
    add_column :version_nodes, :kind, :string
  end
end
