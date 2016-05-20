class SessionsController < ApplicationController
  
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(params[:user][:id])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Welcome back to the theme park!"
      redirect_to user_path(@user)
    else
      flash[:notice] = "User does not exist."
      redirect_to signin_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
  
end