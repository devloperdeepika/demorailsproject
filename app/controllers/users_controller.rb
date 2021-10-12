class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show 
    @user = User.find(params[:id])
    @stocks = @user.stocks 
  end

  def new
    @user = user.new
  end 
  
  def create 
    @user = User.new(params[:user])
    if @user.save 
      session[:user_id] = @user.id 
      flash[:notice] = "thank you for signing up! you are logged in"
      redirect_to root_path
    else
      render :new
    end
  end 
  private 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end  
end
