class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by_session_token( session[:token] )
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    user.password = user_params[:password]
    session[:token] = user.reset_session_token!
    @current_user = user
  end

  def logout!
    @current_user = nil
    session[:token] = SecureRandom.hex
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end


  private

  #if this doesn't work, copy paste to 2 controllers
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
