require_relative './noughts_and_crosses.rb'

class Cli
  def self.start_new_game(input = $stdin, output = $stdout)
    @@current_game = Cli.new(input, output)
  end

  private

  def initialize(input = $stdin, output = $stdout)
    @input = input
    @output = output
    @game = NoughtsAndCrosses.new
    game_loop
  end

  def game_loop
    display_board
    instruction = @input.gets
    return if instruction == 'exit'

    desired_position = Integer(instruction)
    @game.take_turn(desired_position)

    if @game.winner
      display_board
      @output.puts "Congrats #{@game.winner}"
    elsif @game.board_full?
      display_board
      @output.puts "The game is a draw"
    else
      game_loop
    end
  end

  def display_board
    @output.puts @game.board.each_slice(3).map { |s| s.join(' | ') }.join("\n- + - + -\n")
    @output.puts
  end
end
