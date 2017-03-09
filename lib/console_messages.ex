defmodule TicTacToe.ConsoleMessages do
  alias TicTacToe.Board, as: Board

  @player_one_mark " X "
  @player_two_mark " O "
  @vertical_bar "|"
  @horizontal_bar "\n-----------\n"
  @newline "\n"

  def formatted_board(board) do
    Enum.join([Enum.at(marks(board), 0), @vertical_bar, Enum.at(marks(board), 1), @vertical_bar, Enum.at(marks(board), 2),
               @horizontal_bar,
               Enum.at(marks(board), 3), @vertical_bar, Enum.at(marks(board), 4), @vertical_bar, Enum.at(marks(board), 5),
               @horizontal_bar,
               Enum.at(marks(board), 6), @vertical_bar, Enum.at(marks(board), 7), @vertical_bar, Enum.at(marks(board), 8),
               @newline], "")
  end

  defp marks(board) do
    Board.current_marks(board)
    |> Enum.with_index
    |> Enum.map(&status_to_symbol/1)
  end

  defp status_to_symbol({status, indx}) do
    case status do
      :player_one -> @player_one_mark
      :player_two -> @player_two_mark
      :empty -> " #{indx} "
    end
  end

  def player_one_turn, do: "It is player one's turn."

  def player_two_turn, do: "It is player two's turn."

  def game_over, do: "The game is over."

  def game_status(status) do
    case status do
      :player_one -> "Player one wins!"
      :player_two -> "Player two wins!"
      :tie -> "The game has ended in a tie."
    end
  end

end
