class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      login(@user)
    else
      flash[:danger] = "Try again"
    end
    redirect_to @user
  end

  def show
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    redirect_to root_path unless logged_in? && authorized?

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def logged_in?
    current_user
  end

  def authorized?
    current_user == @user
  end

end
