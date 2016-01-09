class ExpensesController < ApplicationController
  def index
    @expenses = Expense.ordered
  end

  def show
    @expense = Expense.ordered.includes(:months).find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params[:expense])

    if @expense.save
      redirect_to expenses_path
    else
      render :edit
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(params[:expense])
      redirect_to expense_path(@expense)
    else
      render :edit
    end
  end
end
