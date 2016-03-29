class UsersController < ApplicationController

  before_action :authenticate_user!

  before_action only: [:follow, :unfollow, :block, :unblock] do
    @user = User.find(params[:id])
    redirect_to :back, :alert => "Action not allowed." if @user == current_user
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by id: params[:id]
    follower_ids = @user.following_users.pluck(:id)
    all_ids = follower_ids << @user.id
    @posts = Post.where(user_id: all_ids).order("created_at DESC")
  end

  def feed
    @user = User.find_by id: params[:id]
    @followers = @user.followers
  end

  def follow
    current_user.follow(@user)
    redirect_to :back, :notice => "You are now following #{@user.email}."
  end

  def unfollow
    current_user.stop_following(@user)
    redirect_to :back, :notice => "You are not following #{@user.email}."
  end

  def block
    current_user.block(@user)
    redirect_to :back, :notice => "You have blocked #{@user.email}."
  end

  def unblock
    current_user.unblock(@user)
    redirect_to :back, :notice => "You have unblocked #{@user.email}."
  end
end
