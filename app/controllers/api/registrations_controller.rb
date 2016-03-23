class Api::RegistrationsController < ApplicationController

  protect_from_forgery with: :null_session

  def create
    @user = User.new params.require(:user).permit(:username, :password)
    @user.username = @user.email if @user.email.present?
    @user.email = "#{@user.username}@domain.com" if @user.username.present?

    # TODO: Change back to email after project submission.

    if @user.save
      render :user
    else
      render json: @user.errors, status: 422
    end
  end

end
