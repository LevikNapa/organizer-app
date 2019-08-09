class SessionsController < ApplicationController
  def new
    @user = User.new
    render :login
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
       # raise params.inspect
      redirect_to lists_path # tried to redirect_to user_path(@user) but got an error that its missing and id. Could't identify the issue.
    else
    @user = User.find_by(:username => params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      else
      flash[:message] = "Sorry, please try again"
      redirect_to '/login'
      end
    end
  end


  # def ghcreate  #omniauth login
  #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
  #     u.username = auth['info']['name']
  #     u.email = auth['info']['email']
  #     u.password = auth['uid']
  #   end
  #
  #   session[:user_id] = @user.id
  #
  #   redirect_to '/lists'
  # end

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
