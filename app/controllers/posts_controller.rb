class PostsController < ApplicationController


  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def index
    @posts=Post.all
  end

  def show
    @post=Post.find(params[:id])
    @user=@post.user
    @comment=Comment.new
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
     redirect_to post_path(@post)
    else
     render :edit
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    if params[:keyword].present?
      @post = Post.where('title LIKE ? or body LIKE ?', "%#{params[:keyword]}%","%#{params[:keyword]}%") #'カラムLIKE?',"%#{params[:keyword]}%"が１セット今回は２つのカラムで検索をかけるため２つ用意
      @keyword = params[:keyword]
    else
      @post = Post.all
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:body,:profile_image)
  end

end
