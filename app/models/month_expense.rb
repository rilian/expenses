class MonthExpense < ActiveRecord::Base
  belongs_to :month
  belongs_to :expense

  validates_presence_of :month_id, :expense_id
  validates_uniqueness_of :month_id, scope: :expense_id

  attr_accessible :month_id, :expense_id, :sum_real, :desc

  def calculate_sum_real
    if (sum_real.to_s == '0' || sum_real.blank?) && desc.present?
      sum = eval desc rescue 0
      if sum > 0
        self.sum_real = sum
      end
    end
  end
end
