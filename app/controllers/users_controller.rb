class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

    unless @user
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def index
    @users = User.all
  end

  private

  #if this doesn't work, copy paste to 2 controllers
  def user_params
    params.require(:user).permit(:username, :password)
  end


end
