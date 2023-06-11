require 'spec_helper'

RSpec.describe SeasonManager do
  before(:each) do
    game_path = './fixtures/games.csv'
    team_path = './fixtures/teams.csv'
    game_teams_path = './fixtures/game_teams.csv'
    locations = {
                games: game_path,
                teams: team_path,
                game_teams: game_teams_path
                }
    stat_tracker = StatTracker.new(locations)
    @season_manager = SeasonManager.new(game_teams_path, stat_tracker)
  end

  describe 'exists' do
    it 'can initialize' do
      expect(@season_manager).to be_a(SeasonManager)
    end
  end

  describe '#best_coach' do
    it 'returns the coach with the best win percentage per seaosn' do
      expect(@season_manager.best_coach('20122013')).to be_a(String)
    end
  end
end