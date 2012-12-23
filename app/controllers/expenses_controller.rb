class ExpensesController < ApplicationController
  def index
    @expenses = Expenses
  end
end
