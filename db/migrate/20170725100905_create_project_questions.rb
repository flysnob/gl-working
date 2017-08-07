class CreateProjectQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :project_questions do |t|
      t.timestamps null: false
    end

    add_reference :project_questions, :project, foreign_key: true
    add_reference :responses, :project_question, foreign_key: true
    add_reference :project_questions, :question, foreign_key: true
  end
end
