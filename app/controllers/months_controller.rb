class MonthsController < ApplicationController
  def index
    @months = Month.all
  end
end
