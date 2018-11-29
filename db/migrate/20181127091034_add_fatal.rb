class AddFatal < ActiveRecord::Migration[5.0]
  def change
    add_column :nodes, :response_fatal, :string
    add_column :nodes, :target_fatal, :string

    add_column :version_nodes, :response_fatal, :string
    add_column :version_nodes, :target_fatal, :string
  end
end
