class SessionsController < ApplicationController

  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    @user = User.find_by_email(params[:email].downcase)

    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Welcome back, #{@user.username}!"
      redirect_to new_location_path
    else
      flash[:error] = "We couldn't sign you in."
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Signed out. Come back soon!"
    redirect_to login_path
  end

end
