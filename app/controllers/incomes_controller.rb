class IncomesController < ApplicationController

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to incomes_path
      flash[:notice] = "収入科目を登録しました。"
    else
      render new_income_path
    end
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
    @income = Income.find(params[:id])
    @income.update(income_params)
    if @income.save
      redirect_to incomes_path
      flash[:notice] = "収入科目を登録しました。"
    else
      render new_income_path
    end
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to incomes_path
    flash[:notice] = "科目を削除しました。"
  end

  private

  def income_params
    params.require(:income).permit(:name, :description)
  end
end
