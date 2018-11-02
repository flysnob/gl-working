class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.boolean :conclusion_pause, default: false
      t.boolean :analysis_shortcut, default: true
      t.datetime :subscription_start
    end
  end
end
