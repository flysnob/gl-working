class AddPaidtoProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :paid, :boolean, default: false
  end
end
