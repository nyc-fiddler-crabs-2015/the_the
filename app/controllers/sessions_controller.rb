class SessionsController < ApplicationController

  def new
  end

  def create
     hey = params[:user]
     user = User.find_by(username: hey[:username])
    if user && user.try(:authenticate, hey[:password])
      session[:user_id] = user.id
      render :json => {location: '/songs'}
    else
      render :json =>{errors: "hey"}, :status => 401
    end
  end

  def show
  end


  def destroy
    session[:user_id]=nil
    redirect_to :root
  end
end
