class SessionsController < ApplicationController
  def new
    @user = User.new
    render :login
  end

  def create
    # if
    #  @user = User.find_or_create_by_omniauth(auth)
    #  session[:user_id] = @user.id
    #  redirect_to user_path(@user)
     # tried to redirect_to user_path(@user) but got an error that its missing and id. Could't identify the issue.
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
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['nickname']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex
    end

    session[:user_id] = @user.id

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
