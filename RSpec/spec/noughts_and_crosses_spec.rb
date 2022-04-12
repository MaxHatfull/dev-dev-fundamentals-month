# frozen_string_literal: true

require "noughts_and_crosses"

RSpec.describe NoughtsAndCrosses do
  subject(:game) { described_class.new }

  describe "#play_game" do
    it "runs the game" do
      expect(game.play_game).to eq(true)
    end
  end
end
