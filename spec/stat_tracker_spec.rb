require 'spec_helper'

RSpec.describe StatTracker do
  before(:each) do
    game_path = './fixtures/games.csv'
    team_path = './fixtures/teams.csv'
    game_teams_path = './fixtures/game_teams.csv'
    @locations = {
                games: game_path,
                teams: team_path,
                game_teams: game_teams_path
                }
    @stat_tracker = StatTracker.new(@locations)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@stat_tracker).to be_a(StatTracker)
      expect(@stat_tracker.instance_variable_get(:@game_manager)).to be_a(GameManager)
      expect(@stat_tracker.instance_variable_get(:@league_manager)).to be_a(LeagueManager)
      expect(@stat_tracker.instance_variable_get(:@season_manager)).to be_a(SeasonManager)
    end
  end
end




