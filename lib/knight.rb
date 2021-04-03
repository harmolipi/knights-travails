# frozen_string_literal: true

require 'pry'

# game knight piece
class Knight
  POSSIBLE_MOVES = [[-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]].freeze
  @current_square = [1, 3]

  def initialize
    @current_square = [1, 3]
  end

  def knight_moves(start, goal)
  end

  def valid_move?(move)
    new_square = [(@current_square[0] + move[0]), (@current_square[1] + move[1])]
    return true unless new_square[0] < 1 || new_square[0] > 8 || new_square[1] < 1 || new_square[1] > 8

    false
  end
end

my_knight = Knight.new
p my_knight.valid_move?([-2, 1])
