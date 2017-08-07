class CreateProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :date
      t.string :entity

      t.timestamps null: false
    end

    add_reference :projects, :user, foreign_key: true
  end
end
