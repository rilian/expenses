class MonthsController < ApplicationController
  def index
    @months = Month
  end
end
