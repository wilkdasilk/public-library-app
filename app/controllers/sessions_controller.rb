class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:info] = "You're in!"
      redirect_to @user
    else
      flash[:error] = "Try again"
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:info] = "Logged out."
    redirect_to root_path
  end

end
