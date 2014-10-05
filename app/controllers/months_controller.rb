class MonthsController < ApplicationController
  def index
    @months = Month.ordered
  end

  def show
    @month = Month.ordered.includes(:expenses).find(params[:id])
  end

  def new
    @month = Month.new
  end

  def create
    @month = Month.new(params[:month])

    if @month.save
      redirect_to months_path
    else
      render :edit
    end
  end

  def edit
    @month = Month.includes(:expenses).find(params[:id])
  end

  def update
    @month = Month.find(params[:id])
    if @month.update_attributes(params[:month])
      redirect_to month_path(@month)
    else
      render :edit
    end
  end
end
