class SessionsController < ApplicationController
  def new
    @user = User.new
    render :login
  end

  def create
      @user = User.find_by(:username => params[:user][:username])
     if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
     else
        flash[:message] = "Sorry, please try again"
        redirect_to '/login'
     end
  end


  def ghcreate  #omniauth login
    @user = User.from_omniauth(auth)
    session[:user_id] = @user.id
    # binding.pry
    redirect_to user_path(@user)
  end

  def home

  end
  
  #logout
  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
