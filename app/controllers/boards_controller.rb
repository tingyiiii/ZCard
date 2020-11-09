class BoardsController < ApplicationController
  # 直接在這渲染
  # def index
  #   render html: "aaa"
  #   render 'boards/aaa' =>  若views裡的html檔名不符合慣例可以直接指定
  # end
  
  def index
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

    clean_params = params.require(:board).permit(:title)
    @board = Board.new(clean_params)
    # @board.title = params['board']['title'] =>若只有一欄可不用洗乾淨

    if @board.save
      # flash["notice"] = "成功新增看板"
      redirect_to "/", notice: '成功新增看板'
    else
      render :new  # =render 'board/new'
    end

  end
end
