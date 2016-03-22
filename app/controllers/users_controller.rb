class UsersController < ApplicationController

  # TODO: Add tests
  # TODO: Add search

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by id: params[:id]
    # TODO: Show user info
    # TODO: This may end up being a duplicate for the feed now that I think about it.
  end

  def feed
    @user = User.find_by id: params[:id]
    # TODO: Get users posts
    # TODO: Get posts from the users they follow
    # TODO: Prevent viewers from seeing the posts from the users they follow.
    # TODO: Add act_as_follower somewhere
  end

end
