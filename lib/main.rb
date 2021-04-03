# frozen_string_literal: true

require_relative 'board'

def print_board(board)
  p board.squares[0..7]
  p board.squares[8..15]
  p board.squares[16..23]
  p board.squares[24..31]
  p board.squares[32..39]
  p board.squares[40..47]
  p board.squares[48..55]
  p board.squares[56..63]
end

my_board = Board.new
print_board(my_board)
