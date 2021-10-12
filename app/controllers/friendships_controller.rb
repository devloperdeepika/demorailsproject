class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all
  end  
  
  def create
    @friendship = current_user.friendships.build(friend_params)
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end
  
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to friendships_path
  end

  private

  def friend_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end