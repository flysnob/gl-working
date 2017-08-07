class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :module_code, null: false
      t.string :question_code, null: false
      t.text :question, null: false
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
      t.string :fail_response

      t.timestamps null: false
    end

    add_reference :questions, :subject, foreign_key: true
  end
end
