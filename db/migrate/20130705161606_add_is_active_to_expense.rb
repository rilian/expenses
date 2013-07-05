class AddIsActiveToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :is_active, :boolean, null: false, default: true

    add_index :expenses, :is_active
  end
end
