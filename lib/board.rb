# frozen_string_literal: true

require 'pry'

# game board
class Board
  attr_reader :squares

  def initialize
    @squares = []

    (1..8).each do |x|
      (1..8).each do |y|
        @squares << [x, y]
      end
    end

    

  end
end
