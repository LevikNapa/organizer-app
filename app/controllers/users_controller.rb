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
      # raise params.inspect
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  def show
    @user = User.find_by_id(params[:id])
    redirect_to '/' if !@user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)

  end

end
