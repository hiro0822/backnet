class User::UsersController < ApplicationController
  before_action :set_user, only: [:favorites]
  before_action :not_guest_user!, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10)
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
   @user = User.find(params[:id])
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def favorites
    favorite=Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorites=Post.find(favorite)
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:introduction,:email,:profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def not_guest_user!
    if current_user.email == "aaa@aaa.com"
      flash[:alert] = "ゲストユーザーは編集できません"
      redirect_to user_user_path(current_user)
    end
  end
end
