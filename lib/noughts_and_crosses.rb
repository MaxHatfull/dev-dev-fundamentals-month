# frozen_string_literal: true

class InvalidPositionError < StandardError; end

class NoughtsAndCrosses
  def self.start_game
    NoughtsAndCrosses.new
  end

  def initialize
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @players = [:o, :x]
    @current_player_index = 0
  end

  attr_reader :board

  def take_turn(position)
    raise InvalidPositionError if @board[position].is_a? Symbol

    @board[position] = players[current_player_index]
    @current_player_index = (current_player_index + 1) % players.length
  end

  def winner
    winning_combinations.map do |winning_combination|
      if winning_combination.map { |position| @board[position] }.uniq.length == 1
        @board[winning_combination[0]]
      end
    end.compact.fetch(0, nil)
  end

  private

  attr_reader :current_player_index
  attr_reader :players

  def winning_combinations
    [2,7,6,9,5,1,4,3,8]
      .combination(3)
      .select {|combination| combination.sum == 15 }


    # [
    #   [0, 1, 2],
    #   [3, 4, 5],
    #   [6, 7, 8],

    #   [0, 3, 6],
    #   [1, 4, 7],
    #   [2, 5, 8],

    #   [0, 4, 8],
    #   [2, 4, 6],
    # ]
  end
end
