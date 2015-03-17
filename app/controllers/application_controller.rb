class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery except: :index

  def index
  end

  def about
    render :layout => false
  end

  protected

    def user_home
      raise "User is not signed in" unless session[:user_id]
      session_path(session[:user_id])
    end
end
