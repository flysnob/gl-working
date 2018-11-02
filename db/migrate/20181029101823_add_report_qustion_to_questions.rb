class AddReportQustionToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :report_content, :string
  end
end
