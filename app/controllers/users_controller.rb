class UsersController < ApplicationController
  #loads the signup form
  def new
   @user = User.new
  end

  #user signup
  def create
    @user = User.new(user_params)
    if @user.save
      #logging in user
      session[:user_id] = @user.id
      redirect_to lists_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)

  end

end
