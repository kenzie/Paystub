class UsersController < ApplicationController

  def new
    redirect_to payrolls_path if admin?
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to payrolls_path, :notice => "Created new account for #{@user.name}"
    else
      render :action => :new
    end
  end

end