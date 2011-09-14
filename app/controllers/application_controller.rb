class ApplicationController < ActionController::Base

  protect_from_forgery

private

  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def admin?
    session[:user_id]
  end
  helper_method :admin?

  def admin_required
    redirect_to new_session_path, :notice => 'You must sign in' unless admin?
  end

end
