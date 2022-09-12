class CommentsController < ApplicationController


  def create
    @post=Post.find(params[:post_id])
    @comment=Comment.new(post_comment_params)
    @comment.post_id=@post.id
    @comment.user_id=current_user.id
    @comment.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @post=Post.find(params[:post_id])
    @comment=Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def post_comment_params
    params.require(:comment).permit(:comment)
  end
end
