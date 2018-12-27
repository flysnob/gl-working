class AddCodeToSubject < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :module_code, :string
    add_column :subjects, :report_summary, :string
  end
end
