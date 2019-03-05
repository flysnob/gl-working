class AddArticlesToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :articles, :string
  end
end
