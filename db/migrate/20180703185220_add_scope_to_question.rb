class AddScopeToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :scope, :boolean
  end
end
