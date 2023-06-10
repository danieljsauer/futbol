require 'spec_helper'

RSpec.describe LeagueManager do
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
    game_manager = GameManager.new(game_path, stat_tracker)
    @league_manager = LeagueManager.new(team_path, stat_tracker, game_manager.games)
  end

  describe '#exists' do
    it 'can initialize' do
      expect(@league_manager).to be_a(LeagueManager)
    end
  end

  describe '#count_of_teams' do
    it 'can count total number of teams in the data' do
      expect(@league_manager.count_of_teams).to be_a(Integer)
      expect(@league_manager.count_of_teams).to eq(32)
    end
  end

  describe '#best_offense' do
    it 'can name the team with the highest average number of goals scored per game accross all seasons' do
      expect(@league_manager.best_offense).to be_a(String)
      expect(@league_manager.best_offense).to eq("New York Red Bulls")
    end
  end

  describe '#worst_offense' do
    it 'can name the team with the lowest average number of goals scored per game accross all seasons' do
      expect(@league_manager.worst_offense).to be_a(String)
      expect(@league_manager.worst_offense).to eq("FC Cincinnati")
    end
  end
end