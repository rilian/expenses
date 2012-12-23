# encoding: utf-8

class Month < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  has_many :month_expenses, dependent: :destroy, inverse_of: :month

  # Validations: presence > by type > validates
  validates_presence_of :name, :result

  # Other properties (e.g. accepts_nested_attributes_for)
  attr_accessible :name, :result

  # Model dictionaries, state machine

  # Scopes
  class << self
  end

  # Other model methods

  # Private methods (for example: custom validators)
  private

end
