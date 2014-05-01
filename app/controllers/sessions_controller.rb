class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(user_params)

    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Incorrect username and/or password."]
      render :new
    end
  end

  def destroy
    logout!
    render :new
  end

  private

  #if this doesn't work, copy paste to 2 controllers
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
