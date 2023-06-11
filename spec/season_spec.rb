require 'spec_helper'

RSpec.describe Season do
  before(:each) do 
    @season = Season.new(
                        game_id: '3',
                        team_id: '6',
                        hoa: 'away',
                        result: 'WIN',
                        head_coach: 'John Tortorella',
                        goals: '2',
                        shots: '8',
                        tackles: '44'
                        )
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@season).to be_a(Season)
      expect(@season.game_id).to eq('3')
      expect(@season.team_id).to eq('6')
      expect(@season.home_or_away).to eq('away')
      expect(@season.result).to eq('WIN')
      expect(@season.head_coach).to eq('John Tortorella')
      expect(@season.goals).to eq('2')
      expect(@season.shots).to eq('8')
      expect(@season.tackles).to eq('44')
    end
  end

  # describe '#coach_wins(season)' do
  #   it 'returns the number of wins a coach has in a season' do
  #     expect(@season.coach_wins(season)).to be_a(Integer)
  #   end
  # end
end