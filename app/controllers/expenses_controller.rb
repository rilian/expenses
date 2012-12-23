class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end


  def show
    @expense = Expense.find(params[:id])
  end

  def new
  end

  def create
    if @expense.save
      redirect_to expenses_path
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @expense.update_attributes(params[:expense])
      redirect_to expense_path(@expense)
    else
      render :edit
    end
  end
end
