defmodule ConsoleMessagesTest do
  use ExUnit.Case
  alias TicTacToe.Board, as: Board
  alias TicTacToe.ConsoleMessages, as: Messages

  describe "a formatted board for the console" do

    test "returns a blank board" do
      output = " 0 | 1 | 2 \n-----------\n 3 | 4 | 5 \n-----------\n 6 | 7 | 8 \n"
      assert Messages.formatted_board(Board.empty_board) == output
    end

    test "returns a board with one mark in the first cell" do
      marked_board = Board.mark(Board.empty_board, 0, :player_one)
      output = " X | 1 | 2 \n-----------\n 3 | 4 | 5 \n-----------\n 6 | 7 | 8 \n"
      assert Messages.formatted_board(marked_board) == output
    end

    test "returns a board with two marks" do
      marked_board = Board.empty_board
      |> Board.mark(1, :player_one)
      |> Board.mark(5, :player_two)
      output = " 0 | X | 2 \n-----------\n 3 | 4 | O \n-----------\n 6 | 7 | 8 \n"
      assert Messages.formatted_board(marked_board) == output
    end

    test "returns a board with three marks" do
      marked_board = Board.empty_board
      |> Board.mark(3, :player_one)
      |> Board.mark(7, :player_two)
      |> Board.mark(2, :player_one)
      output = " 0 | 1 | X \n-----------\n X | 4 | 5 \n-----------\n 6 | O | 8 \n"
      assert Messages.formatted_board(marked_board) == output
    end

    test "returns a filled board" do
      marked_board = Board.empty_board
      |> Board.mark(0, :player_one)
      |> Board.mark(1, :player_two)
      |> Board.mark(2, :player_one)
      |> Board.mark(3, :player_one)
      |> Board.mark(4, :player_two)
      |> Board.mark(5, :player_one)
      |> Board.mark(6, :player_one)
      |> Board.mark(7, :player_two)
      |> Board.mark(8, :player_one)
      output = " X | O | X \n-----------\n X | O | X \n-----------\n X | O | X \n"
      assert Messages.formatted_board(marked_board) == output
    end

  end

  describe "messages to guide the user through the game" do

    test "returns a message when it is player one's turn" do
      assert Messages.player_one_turn == "It is player one's turn."
    end

    test "returns a message when it is player two's turn" do
      assert Messages.player_two_turn == "It is player two's turn."
    end

    test "returns a message when the game is over" do
      assert Messages.game_over == "The game is over."
    end

    test "returns player one as a winner" do
      assert Messages.game_status(:player_one) == "Player one wins!"
    end

    test "returns player two as a winner" do
      assert Messages.game_status(:player_two) == "Player two wins!"
    end

    test "returns neither player as a winner in a tie game" do
      assert Messages.game_status(:tie) == "The game has ended in a tie."
    end

    test "returns a message that an input is too small" do
      assert Messages.input_too_small == "That cell value is too small!"
    end

    test "returns a message that an input is too large" do
      assert Messages.input_too_large == "That cell value is too large!"
    end

    test "returns a message that a cell has been taken" do
      assert Messages.input_already_taken == "That cell has already been taken!"
    end

    test "returns a message that the player must choose a valid cell" do
      assert Messages.choose_valid_cell == "You need to enter an integer between 0 and 8."
    end

    test "returns a move prompt" do
      assert Messages.move_prompt == "Enter your move: "
    end

    test "returns a confirmation of a move" do
      assert Messages.move_confirmation(0) == "You are moving in cell 0."
    end

    test "returns a confirmation of a different move" do
      assert Messages.move_confirmation(6) == "You are moving in cell 6."
    end

  end

end