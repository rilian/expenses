# encoding: utf-8

class Expense < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)
  default_scope order('weight DESC')

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  has_many :month_expenses, dependent: :destroy, inverse_of: :expense
  has_many :months, through: :month_expenses

  # Validations: presence > by type > validates
  validates_presence_of :name, :weight
  validates_uniqueness_of :name

  # Other properties (e.g. accepts_nested_attributes_for)
  attr_accessible :name, :weight, :is_active

  # Model dictionaries, state machine

  # Scopes
  class << self
  end

  scope :active, ->() { where(is_active: true) }

  # Other model methods

  # Private methods (for example: custom validators)
  private

end
