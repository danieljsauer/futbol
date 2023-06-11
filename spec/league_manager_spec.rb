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
    @league_manager = LeagueManager.new(team_path, stat_tracker)
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

  describe '#highest_scoring_visitor' do
    it 'can name the team with the highest average score per game across all seasons when they are away' do
      expect(@league_manager.highest_scoring_visitor).to be_a(String)
      expect(@league_manager.highest_scoring_visitor).to eq("New York Red Bulls")
    end
  end

 # helper methods
  describe '#most_wins_team_id' do
    it 'can track the most wins by id' do
      expect(@league_manager.most_wins_team_id).to be_a(Integer)
      expect(@league_manager.most_wins_team_id).to eq(8)
    end
  end

  describe '#most_losses_team_id' do
    it 'can track the most losses by id' do
      expect(@league_manager.most_losses_team_id).to be_a(Integer)
      expect(@league_manager.most_losses_team_id).to eq(26)
    end
  end
end