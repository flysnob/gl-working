class CreateContent < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :content
      t.datetime :effective
    end
  end
end
