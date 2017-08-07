class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end

    add_reference :projects, :subject, foreign_key: true
  end
end
