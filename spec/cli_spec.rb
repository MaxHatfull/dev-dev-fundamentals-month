# frozen_string_literal: true

require "cli"

RSpec.describe Cli do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new(moves.join("\n")) }

  context "a normal game" do
    let(:moves) {[3,1,4,2,5]}

    it "can play a game" do
      described_class.start_new_game(input, output)

      expect(output.string).to eq <<GAMEOUTPUT
0 | 1 | 2
- + - + -
3 | 4 | 5
- + - + -
6 | 7 | 8

0 | 1 | 2
- + - + -
o | 4 | 5
- + - + -
6 | 7 | 8

0 | x | 2
- + - + -
o | 4 | 5
- + - + -
6 | 7 | 8

0 | x | 2
- + - + -
o | o | 5
- + - + -
6 | 7 | 8

0 | x | x
- + - + -
o | o | 5
- + - + -
6 | 7 | 8

0 | x | x
- + - + -
o | o | o
- + - + -
6 | 7 | 8

Congrats o
GAMEOUTPUT

    end
  end

  context "a game where we exit early" do
    let(:moves) { [3,"exit"] }

    it "can play a game" do
      described_class.start_new_game(input, output)

      expect(output.string).to eq <<GAMEOUTPUT
0 | 1 | 2
- + - + -
3 | 4 | 5
- + - + -
6 | 7 | 8

0 | 1 | 2
- + - + -
o | 4 | 5
- + - + -
6 | 7 | 8

GAMEOUTPUT

    end
  end

  context "a game that ends in a draw" do
    let(:moves) { [0,1,4,2,5,3,6,8,7] }

    it "can alert the players to a draw" do
      described_class.start_new_game(input, output)

      expect(output.string.chomp).to end_with "The game is a draw"
    end
  end
end
