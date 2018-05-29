class CreateReturns < ActiveRecord::Migration[5.0]
  def change
    create_table :returns do |t|
      t.integer :node_index
      t.string :question_code
      t.string :return_node_code
      t.integer :status, default: 1, null: false

      t.timestamps null: false
    end

    add_reference :returns, :project, foreign_key: true
  end
end
