class PostsController < ApplicationController
  before_action :session_required, only: [:new, :create]
  before_action :set_board, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    # 文章角度(醜)
    # @post = Post.new(post_params)
    # @post.board = @board
    # @post.user = current_user

    # 看板角度
    # @post = @board.new(post_params)
    # @post.user = current_user

    # 使用者角度
    @post = current_user.posts.new(post_params)
    @post.board = @board

    if @post.save
      redirect_to root_path, notice: '新增文章成功！'
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

end