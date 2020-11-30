class CommentsController < ApplicationController
  before_action :session_required
  before_action :set_post

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    if @comment.save
      redirect_to @post, notice: "成功留言！"
    else
      render 'posts/show'
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
  def set_post
    @post = Post.find(params[:post_id])
  end
end