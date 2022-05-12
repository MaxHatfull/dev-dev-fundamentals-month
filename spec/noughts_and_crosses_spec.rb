# frozen_string_literal: true

require "noughts_and_crosses"

RSpec.describe NoughtsAndCrosses do
  it "starts a new game" do
    expect(described_class.start_game.class).to eq(described_class)
  end

  context "when a game is running" do
    let!(:game) { described_class.start_game }

    it "returns the board" do
      expect(game.board).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end

    it "generates a string representing the game board" do
      expect(game.to_s).to eq <<GAMEOUTPUT.chomp
0 | 1 | 2
- + - + -
3 | 4 | 5
- + - + -
6 | 7 | 8
GAMEOUTPUT

    end

    describe "#take_turn" do
      subject { game.board }

      context "when the first turn has been taken" do
        before { game.take_turn(4) }

        it { is_expected.to eq [0, 1, 2, 3, :o, 5, 6, 7, 8] }
      end

      it "allows the second turn to be taken" do
        game.take_turn(4)
        game.take_turn(5)

        expect(game.board).to eq([0, 1, 2, 3, :o, :x, 6, 7, 8])
      end

      it "does not allow you to take a turn in an occupied position" do
        game.take_turn(4)

        expect { game.take_turn(4) }.to raise_error(InvalidPositionError)
      end
    end

    describe "#winner" do
      it "has the correct winner when one player gets 3 in a row" do
        game.take_turn(0)
        game.take_turn(5)
        game.take_turn(1)
        game.take_turn(8)
        game.take_turn(2)

        expect(game.winner).to eq :o
      end

      it "has the correct winner when one player gets 3 in a column" do
        game.take_turn(5)
        game.take_turn(0)
        game.take_turn(8)
        game.take_turn(3)
        game.take_turn(4)
        game.take_turn(6)

        expect(game.winner).to eq :x
      end

      it "is nil when there is no winner" do
        game.take_turn(0)
        game.take_turn(5)

        expect(game.winner).to eq nil
      end
    end

    describe "#draw" do
      it "is false when the board is empty" do

        expect(game.draw?).to eq false
      end

      it "is false when the board is not full" do
        game.take_turn(4)
        game.take_turn(1)
        game.take_turn(5)
        game.take_turn(3)
        game.take_turn(2)
        game.take_turn(8)
        game.take_turn(0)
        game.take_turn(7)

        expect(game.draw?).to eq false
      end

      it "is true when all spots have been taken" do
        game.take_turn(4)
        game.take_turn(1)
        game.take_turn(5)
        game.take_turn(3)
        game.take_turn(2)
        game.take_turn(8)
        game.take_turn(0)
        game.take_turn(7)
        game.take_turn(6)

        expect(game.draw?).to eq true
      end
    end
  end
end
