class CreateMonthExpenses < ActiveRecord::Migration
  def change
    create_table :month_expenses do |t|
      t.integer :expense_id, null: false
      t.integer :month_id, null: false
      t.string :desc, null: false, default: ''
      t.integer :sum_planned, null: false, default: 0
      t.integer :sum_real, null: false, default: 0
    end

    add_index :month_expenses, [:month_id, :expense_id], unique: true
  end
end
