# frozen_string_literal: true

require "cli"

RSpec.describe Cli do
  context "a normal game" do
    let(:input) { StringIO.new("3\n1\n4\n2\n5") }
    let(:output) { StringIO.new }

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
    let(:input) { StringIO.new("3\nexit") }
    let(:output) { StringIO.new }

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
end
