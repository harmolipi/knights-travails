# frozen_string_literal: true

require 'pry'

# game knight piece
class Knight
  attr_accessor :current_square
  POSSIBLE_MOVES = [[-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]].freeze

  def initialize
    @current_square = [1, 3]
  end

  def knight_moves(start = current_square, goal, searched)
    binding.pry
    next_moves = POSSIBLE_MOVES.map { |move| [(start[0] + move[0]), (start[1] + move[1])] }
    selected = next_moves.select { |move| self.valid_move?(move) }
    p "next_moves: #{next_moves}"
    p "selected: #{selected}"

    route = []
    queue = []
    selected.each { |x| queue << x }
    if selected.include?(goal)
      route << selected.bsearch { |x| x == goal }
      return route
    else
      until queue.empty?
        queue.each do |x| 
          unless searched.include?(x)
            queue << x 
            searched << x
            route << self.knight_moves(x, goal, searched)
          end
        end
      end

    end

    p route
    p queue
    

    
  end

  def valid_move?(move)
    # binding.pry
    # new_square = [(current_square[0] + move[0]), (current_square[1] + move[1])]
    # return true unless new_square[0] < 1 || new_square[0] > 8 || new_square[1] < 1 || new_square[1] > 8
    return true unless move[0] < 1 || move[0] > 8 || move[1] < 1 || move[1] > 8

    false
  end
end

my_knight = Knight.new
p my_knight.valid_move?([-2, 1])
my_knight.knight_moves([1, 1], [3, 6], [])
