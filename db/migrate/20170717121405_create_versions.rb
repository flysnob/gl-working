class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|
      t.string :module_code, null: false
      t.string :version_number, null: false
      t.datetime :effective_date
      t.datetime :expiration_date
      t.string :status
      t.text :json

      t.timestamps null: false
    end

    add_reference :projects, :version, foreign_key: true
    add_reference :versions, :subject, foreign_key: true
  end
end
