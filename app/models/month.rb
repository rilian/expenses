class Month < ActiveRecord::Base
  after_create :generate_month_expenses, if: Proc.new { |m| m.month_expenses.blank? }

  has_many :month_expenses, dependent: :destroy, inverse_of: :month
  has_many :expenses, through: :month_expenses

  validates_presence_of :name

  attr_accessible :name, :result, :month_expenses_attributes

  accepts_nested_attributes_for :month_expenses

  scope :ordered, -> { order('id DESC') }

private

  def generate_month_expenses
    Expense.active.ordered.each do |expense|
      MonthExpense.create(month_id: self.id, expense_id: expense.id)
    end
  end
end
