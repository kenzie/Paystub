class SessionsController < ApplicationController

  before_filter :require_admin, :only => :destroy

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to payrolls_path, :notice => "Signed in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path, :notice => "Signed out!"
  end

end