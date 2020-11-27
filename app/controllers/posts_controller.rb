class PostsController < ApplicationController
  before_action :session_required, only: [:new, :create, :edit, :update]
  before_action :set_board, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update]

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
      # = redirect_to boards_path(@board), notice: '新增文章成功！'
      redirect_to @board, notice: '新增文章成功！'
    else
      render :new
    end
  end

  def show
  end

  def edit
    # @post = Post.find_by!(id: params[:id], user: current_user)
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: '文章更新成功！'
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end


end


