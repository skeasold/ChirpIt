class Api::RegistrationsController < ApplicationController

  protect_from_forgery with: :null_session

  def create
    @user = User.new params.require(:user).permit(:email, :password)

    # TODO: Chnge permit by email to username and set email to username. this
    # is for assignment completion only.
    
    if @user.save
      render :user
    else
      render json: @user.errors, status: 422
    end
  end
end
