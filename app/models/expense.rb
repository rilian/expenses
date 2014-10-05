class Expense < ActiveRecord::Base
  default_scope order('weight DESC')

  has_many :month_expenses, dependent: :destroy, inverse_of: :expense
  has_many :months, through: :month_expenses

  validates_presence_of :name, :weight
  validates_uniqueness_of :name

  attr_accessible :name, :weight, :is_active

  scope :active, ->() { where(is_active: true) }
end
