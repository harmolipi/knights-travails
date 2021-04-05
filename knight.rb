# frozen_string_literal: true

# game knight piece with location and previous location's piece
class Knight
  attr_reader :location, :previous

  POSSIBLE_MOVES = [[-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]].freeze
  ERROR = "You entered some invalid values. Please try again.\n\n"
  @searched = []

  def initialize(location, previous = nil)
    @location = location
    @previous = previous
  end

  def self.input_values(recursive)
    start = []
    goal = []
    puts "\nHey there friend. Want to see the shortest path from any chess square to any other with a knight?"
    print "\nGreat. "
    begin
      print "Enter the row for the knight's starting position (1-8 for all of these): "
      start[0] = gets.chomp.to_i
      print 'Now enter the column: '
      start[1] = gets.chomp.to_i
      print "\nSplendid. Now enter the row for the square you'd like to end up on: "
      goal[0] = gets.chomp.to_i
      print 'And the column: '
      goal[1] = gets.chomp.to_i
      raise unless Knight.valid_move?(start) && Knight.valid_move?(goal)
    rescue StandardError
      puts ERROR
      retry
    end

    puts "\n---------------"
    Knight.knight_moves(start, goal, recursive)
  end

  def next_moves
    POSSIBLE_MOVES.map { |move| [(location[0] + move[0]), (location[1] + move[1])] }
                  .filter { |move| Knight.valid_move?(move) }
                  .map { |move| Knight.new(move, self) }
  end

  def trace_path_iterative
    puts "\nMode: iterative"
    path = []
    current = self
    until current.nil?
      path << current.location
      current = current.previous
    end
    path
  end

  def trace_path_recursive(knight = self)
    path = []
    if knight.nil?
    puts "\nMode: recursive"
      path
    else
      path << knight.location
      path += trace_path_recursive(knight.previous)
    end
    path
  end

  def self.knight_moves(start, goal, recursive)
    if start == goal
      current = Knight.new(start)
    else
      queue = Knight.new(start).next_moves
      current = queue.shift
    end

    until current.location == goal
      @searched << current.location
      queue += current.next_moves
      current = queue.shift
    end

    path = recursive ? current.trace_path_recursive : current.trace_path_iterative

    puts "\nYou can reach that square in #{path.length - 1} moves! Here's the route:"
    path.reverse.each { |x| puts " - #{x}" }
  end

  def self.valid_move?(move)
    return true if move[0].between?(1, 8) && move[1].between?(1, 8) && !@searched.include?(move)

    false
  end
end

recursive = true

# Knight.knight_moves([1, 1], [8, 8], recursive)
Knight.input_values(recursive)
