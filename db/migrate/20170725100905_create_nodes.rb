class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      # Question
      t.string :module_code
      t.string :question_code
      t.text :content
      t.string :sort
      t.string :kind
      t.text :summary
      t.text :report_summary
      t.text :help
      t.text :faq
      t.text :asc
      t.text :examples
      t.string :conclusion_1
      t.string :conclusion_2
      t.string :conclusion_3
      t.string :meets_response
      # Version
      t.string :response_1
      t.string :response_2
      t.string :response_3
      t.string :target_1
      t.string :target_2
      t.string :target_3
      t.string :target_module
      t.string :return_node
      t.string :decision_node
      t.string :boolean
      t.boolean :return, default: false
      # Response
      t.string :response_value
      t.string :response_text
      t.string :target_node
      t.string :index
      t.string :comment
      t.string :conclusion

      t.timestamps null: false
    end

    add_reference :nodes, :project, foreign_key: true
    add_reference :nodes, :question, foreign_key: true
    add_reference :nodes, :subject, foreign_key: true
  end
end
