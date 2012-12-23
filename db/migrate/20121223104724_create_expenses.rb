class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.integer :weight, null: false, default: 0
    end
  end
end
