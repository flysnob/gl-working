class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.string :kind
      t.string :response_value
      t.string :target_node
      t.string :sequence
      t.string :decision_node
      t.string :meets_value
      t.string :return_node
      t.text :comment
      t.text :conclusion
      t.text :boolean

      t.timestamp null: false
    end

    add_reference :responses, :project, foreign_key: true
  end
end
