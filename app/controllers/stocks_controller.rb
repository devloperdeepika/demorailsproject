class StocksController < ApplicationController
  def index
    @stock = current_user.stocks
  end

  def new
    @stock = Stock.new
  end

  def show
    @stock = Stock.find(params[:id])
    
  end
   

  def create
    @stock = Stock.new(stock_params)
    @stock.user_id = current_user.id
    if @stock.save
      redirect_to @stock
    else
      render :new
    end 
   
  end
  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    if @stock.update(stock_params)
      redirect_to @stock
    else
      render :edit
    end 
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    redirect_to user_path(current_user)
  end
   
  def remove
    stock_ids = current_user.stock_ids
    stock_ids.delete(params[:id].to_i)
    current_user.update(stock_ids: stock_ids)
    redirect_to stocks_path(current_user)
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :price)
  end
end 