class MonthExpense < ActiveRecord::Base
  belongs_to :month
  belongs_to :expense

  validates_presence_of :month_id, :expense_id
  validates_uniqueness_of :month_id, scope: :expense_id

  attr_accessible :month_id, :expense_id, :sum_real, :desc
end
