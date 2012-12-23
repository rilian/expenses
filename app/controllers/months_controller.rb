class MonthsController < ApplicationController
  def index
    @months = Month.includes(:month_expenses)
  end
end
