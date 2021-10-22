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
      # UserMailer.new_stock_email(@stock).deliver_now

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

  def all_stock
    @stocks = Stock.all
  end 

  def buy_stocks
    if(!Stock.exists?(params[:stock_id]))
      flash[:notice] = "Already exists" 
    else 
      stock =Stock.find(params[:stock_id])
      user = current_user.id
      buy = Buystock.create(user_id: current_user.id, stock_id: stock.id)
      buy.save
      flash[:notice] = "Added stock."
      redirect_to root_url
    end
  end

   
  def remove
    stock_ids = current_user.stock_ids
    stock_ids.delete(params[:id].to_i)
    current_user.update(stock_ids: stock_ids)
    redirect_to stocks_path(current_user)
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :price, :image)
  end
end 