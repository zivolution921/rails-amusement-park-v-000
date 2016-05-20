module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if sessions[:user_id]
  end
end
