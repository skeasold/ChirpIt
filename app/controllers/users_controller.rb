class UsersController < ApplicationController

  before_action :authenticate_user!

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
    @user = User.find(params[:id])
    if @user != current_user
      current_user.follow(@user)
      redirect_to :back, :notice => "You are now following #{@user.email}."
    else
      redirect_to :back, :alert => "You cannot follow yourself!"
    end
  end

  def unfollow
    @user = User.find(params[:id])
    if @user != current_user
      current_user.stop_following(@user)
      redirect_to :back, :notice => "You are not following #{@user.email}."
    else
      redirect_to :back, :alert => "You cannot unfollow yourself!"
    end
  end

  def block
    @user = User.find(params[:id])
    if @user != current_user
      current_user.block(@user)
      redirect_to :back, :notice => "You have blocked #{@user.email}."
    else
      redirect_to :back, :alert => "You cannot block yourself!"
    end
  end

  def unblock
    @user = User.find(params[:id])
    if @user != current_user
      current_user.unblock(@user)
      redirect_to :back, :notice => "You have unblocked #{@user.email}."
    else
      redirect_to :back, :alert => "You cannot unblock yourself!"
    end
  end
end
