class Admin::PostsController < ApplicationController
  def index
    @posts=Post.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @post=Post.find(params[:id])
    @user=@post.user
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
end
