class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.string :name, null: false
      t.text :result, null: false, default: ''
    end
  end
end
