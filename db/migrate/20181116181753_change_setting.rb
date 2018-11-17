class ChangeSetting < ActiveRecord::Migration[5.0]
  def change
    remove_column :settings, :conclusion_pause, :boolean
    add_column :settings, :conclusion_pause, :boolean, default: true

    add_reference :settings, :user, foreign_key: true
  end
end
