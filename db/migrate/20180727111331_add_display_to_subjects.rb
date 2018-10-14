class AddDisplayToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :display, :boolean
    add_column :subjects, :status, :integer, default: 0
  end
end
