module BoardsHelper
  def board_title_css(board)
    "board-title board-title-#{board.state}"
  end
end
