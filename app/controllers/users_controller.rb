class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_user_params)

    if @user.save
      sign_in(@user)
      flash[:success] = "Created new user."
      redirect_to new_location_path
    else
      flash.now[:error] = "Failed to create new user."
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(strong_user_params)
      flash[:success] = "User information updated."
      redirect_to user_path(current_user)
    else
      flash.now[:error] = "Could not update user information."
      render :edit
    end
  end

  private

    def strong_user_params
      params.require(:user).permit(
        :username,
        :email,
        :password,
        :password_confirmation
      )
    end

end
