class SessionsController < ApplicationController

  def new
    render layout: false
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.try(:authenticate, hey[:password])
      session[:user_id] = user.id
      render :json => {location: '/songs'}
    else
      render :json => {errors: "Username/Password do not match"}, :status => 401
    end
  end

  def show
  end


  def destroy
    session[:user_id]=nil
    redirect_to :root
  end
end
