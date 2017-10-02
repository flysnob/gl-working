class CreateVersionNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :version_nodes do |t|
      t.string :response_1
      t.string :target_1
      t.string :response_2
      t.string :target_2
      t.string :response_3
      t.string :target_3
      t.string :target_module
      t.string :return_node
      t.string :decision_node
      t.string :boolean
      t.string :meets_response
      t.boolean :return, default: false

      t.timestamps null: false
    end

    add_reference :version_nodes, :version, foreign_key: true
    add_reference :version_nodes, :question, foreign_key: true
  end
end
