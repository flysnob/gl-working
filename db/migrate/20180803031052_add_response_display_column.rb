class AddResponseDisplayColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :nodes, :display_value, :string
  end
end
