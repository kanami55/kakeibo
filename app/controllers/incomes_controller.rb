class IncomesController < ApplicationController

  def new
    @income = Income.new
  end

  def create
  end

  def index
    @incomes = Income.order(create_at: :asc)
  end

  def show
    @income = Income.find(params[:id])
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
