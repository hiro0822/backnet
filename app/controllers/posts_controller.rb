class PostsController < ApplicationController


  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    tag_list = params[:post][:tag_names].split(",")
    @post.tags_save(tag_list)
    @post.save
    redirect_to post_path(@post)
  end

  def index
    @posts=Post.all.order(created_at: :desc).page(params[:page]).per(10)
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

  def tag_search
    if params[:keyword].present?
      tag = Tag.where('tag_name LIKE?',"%#{params[:keyword]}%")
      post_ids = tag.map(&:posts).flatten.uniq
      @post = Post.where(id: post_ids)
      @keyword = params[:keyword]
    else
      @post=Post.all
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:body,:profile_image)
  end

end
