# encoding: utf-8

class MonthExpense < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :month
  belongs_to :expense

  # Validations: presence > by type > validates
  validates_presence_of :month_id, :expense_id
  validates_uniqueness_of :month_id, scope: :expense_id

  # Other properties (e.g. accepts_nested_attributes_for)
  attr_accessible :month_id, :expense_id, :sum_real, :desc

  # Model dictionaries, state machine

  # Scopes
  class << self
  end

  # Other model methods

  # Private methods (for example: custom validators)
  private

end
