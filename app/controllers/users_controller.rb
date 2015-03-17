class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
    render layout: false
  end

  def create
    user         = params[:user].to_hash
    password     = user[:password]
    confirmation = user[:password_confirmation]
    new_user = User.new(user)
    if password == confirmation && new_user.save
      session[:user_id] = new_user.id
      render :json => {location: '/songs'}
    else
      render :json => {errors: new_user.errors.full_messages[0]}, :status => 500
    end
  end

  def show
    @user = User.find(session[:user_id])
    @lyrics = @user.lyrics
  end

end
