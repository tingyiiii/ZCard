class BoardsController < ApplicationController

  before_action :find_board, only: [:show, :edit, :update, :destroy]
  
  # 直接在這渲染
  # def index
  #   render html: "aaa"
  #   render 'boards/aaa' =>  若views裡的html檔名不符合慣例可以直接指定
  # end
  
  def index
    @boards = Board.all.page(params[:page]).per(5)
  end

  def new
    @board = Board.new
  end

  def create
    # 用create方法（不常用）
    # @board = Board.create(params["board"])
    # if @board
    # else
    # end


    @board = Board.new(board_params)
    # @board.title = params['board']['title'] =>若只有一欄可不用洗乾淨

    if @board.save
      # flash["notice"] = "成功新增看板"
      redirect_to "/", notice: '成功新增看板'
    else
      render :new  # =render 'board/new'
    end

  end

  def show
    # @board = Board.find(params[:id])
    @posts = @board.posts.order(id: :desc)
  end

  def edit
    # @board = Board.find(params[:id])
  end

  def update
    # @board = Board.find(params[:id])
    if @board.update(board_params)
      # redirect_to board_path(@board), notice: '更新成功'
      redirect_to @board, notice: '更新成功'
    else
      render :edit
    end

  end
  
  def destroy
    # @board = Board.find(params[:id])
    @board.destroy
    redirect_to root_path, notice: '看板已刪除'
  end

  private

  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end

end
