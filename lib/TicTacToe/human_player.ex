defmodule TicTacToe.HumanPlayer do
  alias TicTacToe.Board, as: Board
  alias TicTacToe.ConsoleMessages, as: Messages
  alias TicTacToe.MoveValidator, as: MoveValidator

  def get_move(board), do: get_move(board, &IO.gets/1)

  def get_move(board, input_function) do
    formatted_input = format_input(input_function)
    formatted_marks = format_marks(board)
    case MoveValidator.validate_cell(formatted_input, formatted_marks) do
      :valid ->
        IO.puts Messages.move_confirmation(formatted_input)
        formatted_input
      :too_small ->
        IO.puts Messages.input_too_small
        get_move(board, input_function)
      :too_large ->
        IO.puts Messages.input_too_large
        get_move(board, input_function)
      :cell_taken ->
        IO.puts Messages.input_already_taken
        get_move(board, input_function)
      :not_an_integer ->
        IO.puts Messages.choose_valid_cell
        get_move(board, input_function)
    end
  end

  defp format_input(input_function) do
    Messages.move_prompt
    |> input_function.()
    |> sanitize
    |> string_to_integer
  end

  defp sanitize(input) do
    input
    |> String.replace("\"", "")
    |> String.replace("'", "")
    |> String.replace(";", "")
    |> String.replace(":", "")
    |> String.replace(",", "")
  end

  defp string_to_integer(input) do
    if integer?(input), do: elem(Integer.parse(input), 0)
  end

  defp integer?(input) do
    !MoveValidator.contains_letter?(input) and
    !MoveValidator.contains_decimal?(input) and
    !MoveValidator.only_newline?(input)
  end

  defp format_marks(board) do
    board
    |> Board.current_marks
    |> List.to_tuple
  end

end
