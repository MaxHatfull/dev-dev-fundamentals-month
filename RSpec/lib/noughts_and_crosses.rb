# frozen_string_literal: true

class InvalidPositionError < StandardError; end

class NoughtsAndCrosses
  def self.start_game
    NoughtsAndCrosses.new
  end

  def initialize
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @current_player = :o
  end

  attr_reader :board

  def take_turn(position)
    raise InvalidPositionError if @board[position].is_a? Symbol

    @board[position] = @current_player
    @current_player = opponent
  end

  def winner
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],

      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],

      [0, 4, 8],
      [2, 4, 6],
    ].map do |winning_combination|
      if winning_combination.map { |i| @board[i] }.uniq.length == 1
        @board[winning_combination[0]]
      end
    end.compact.fetch(0, nil)
  end

  private

  def opponent
    @current_player == :o ? :x : :o
  end
end
