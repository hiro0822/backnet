class User::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_user_path(@user.id)
    else
      render :edit
    end
  end

  def unsubscribe
   @user=User.find(params[:id])
  end

  def withdraw
    @user=current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:nickname,:introduction,:email,:profile_image)
  end

end
