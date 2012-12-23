class MonthsController < ApplicationController
  def index
    @months = Month.includes(:month_expenses)
  end

  def show
    @month = Month.find(params[:id])
  end

  def new
  end

  def create
    if @month.save
      redirect_to months_path
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @month.update_attributes(params[:month])
      redirect_to month_path(@month)
    else
      render :edit
    end
  end
end
