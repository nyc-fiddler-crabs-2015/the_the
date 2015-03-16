module UsersHelper
  def hey
    session[:user_id]
  end
end
