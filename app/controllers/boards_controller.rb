class BoardsController < ApplicationController
  # 直接在這渲染
  # def index
  #   render html: "aaa"
  #   render 'boards/aaa' =>  若views裡的html檔名不符合慣例可以直接指定
  # end
  
  def index
  end

  def new
  end

  def create
    redirect_to "/"
  end
end
