# frozen_string_literal: true

require 'pry'

# game knight piece
class Knight
  attr_accessor :current_square
  attr_reader :location, :previous

  POSSIBLE_MOVES = [[-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]].freeze
  @@searched = []

  def initialize(location, previous = nil)
    @location = location
    @previous = previous
  end

  def trace_path
    # binding.pry
    path = []
    current = self
    until current.nil?
      path << current.location
      current = current.previous
    end
    path
  end

  def to_s
    "Location: #{location}\nPrevious: #{previous.location}\n"
  end

  def next_moves
    POSSIBLE_MOVES.map { |move| [(location[0] + move[0]), (location[1] + move[1])] }
                  .filter { |move| Knight.valid_move?(move) }
                  .map { |move| Knight.new(move, self) }
  end

  def self.knight_moves(start, goal)
    my_knight = Knight.new(start)

    queue = my_knight.next_moves

    queue.each { |x| puts x.to_s + "---\n" }

    current = queue.shift

    until current.location == goal
      queue += current.next_moves
      current = queue.shift
    end

    path = current.trace_path

    puts "You can reach that square in #{path.length - 1} moves! Here's the route:"
    path.reverse.each { |x| puts "-  #{x}" }

    # current.print_path

    # beginning of old  code ----------

    # binding.pry
    # next_moves = POSSIBLE_MOVES.map { |move| [(start[0] + move[0]), (start[1] + move[1])] }
    # selected = next_moves.select { |move| self.valid_move?(move) }
    # p "next_moves: #{next_moves}"
    # p "selected: #{selected}"

    # route = []
    # queue = []
    # selected.each { |x| queue << x }
    # if selected.include?(goal)
    #   route << selected[selected.find_index(goal)]
    #   return route
    # else
    #   until queue.empty?
    #     queue.each do |x|
    #       unless searched.include?(x)
    #         queue << x
    #         searched << x
    #         route << self.knight_moves(x, goal, searched)
    #       end
    #     end
    #   end

    # end

    # p route
    # p queue

    # end of old  code ----------


  end

  def self.valid_move?(move)
    # binding.pry
    # new_square = [(current_square[0] + move[0]), (current_square[1] + move[1])]
    # return true unless new_square[0] < 1 || new_square[0] > 8 || new_square[1] < 1 || new_square[1] > 8
    # return true unless move[0] < 1 || move[0] > 8 || move[1] < 1 || move[1] > 8
    return true if move[0].between?(1, 8) && move[1].between?(1, 8) && !@@searched.include?(move)

    false
  end
end

# my_knight = Knight.new
# p my_knight.valid_move?([-2, 1])
# my_knight.knight_moves([1, 1], [3, 6])

Knight.knight_moves([1, 1], [8, 8])
