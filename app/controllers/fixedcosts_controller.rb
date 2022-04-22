class FixedcostsController < ApplicationController

  def new
    @fixedcost = Fixedcost.new
  end

  def create
    @fixedcost = Fixedcost.new(fixedcost_parames)
    if @fixedcost.save
      redirect_to fixedcosts_path
      flash[:notice] = "固定費科目を登録しました。"
    else
      render new_fixedcost_path
    end
  end

  def index
    @fixedcosts = Fixedcost.order(create_at: :asc)
  end

  def show
    @fixedcost = Fixedcost.find(params[:id])
  end

  def edit
    @fixedcost = Fixedcost.find(params[:id])
  end

  def update
    @fixedcost = Fixedcost.find(params[:id])
    @fixedcost.update(fixedcost_parames)
    if @fixedcost.save
      redirect_to fixedcosts_path
      flash[:notice] = "固定費科目を登録しました。"
    else
      render edit_fixedcost_path
    end
  end

  def destroy
    @fixedcost = Fixedcost.find(params[:id])
    @fixedcost.destroy
    redirect_to fixedcosts_path
    flash[:notice] = "科目を削除しました。"
  end

  private

  def fixedcost_parames
    params.require(:fixedcost).permit(:name, :description)
  end
end
