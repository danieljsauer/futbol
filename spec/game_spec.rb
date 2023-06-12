require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @game = Game.new(
                    game_id: 9,
                    season: 12,
                    away_team_id: 14,
                    home_team_id: 23,
                    away_goals: 0,
                    home_goals: 3
                  )
  end

  describe '#initialize' do
    it '#exists' do
      expect(@game).to be_a(Game)
    end

    it 'has attributes' do
      expect(@game.game_id).to eq(9)
      expect(@game.season).to eq(12)
      expect(@game.away_team_id).to eq(14)
      expect(@game.home_team_id).to eq(23)
      expect(@game.away_goals).to eq(0)
      expect(@game.home_goals).to eq(3)
    end

    it "can add the total score" do 
      expect(@game.total_score).to eq(3)
    end 
  end
end
