require 'spec_helper'

RSpec.describe GameManager do
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
    @game_manager = GameManager.new(game_path, stat_tracker)
  end

  describe '#exists' do
    it 'can initialize' do
      expect(@game_manager).to be_a(GameManager)
    end
  end

  describe '#highest_total_score' do
    it 'can return highest total score of all games' do
      expect(@game_manager.highest_total_score).to be_a(Integer)
      expect(@game_manager.highest_total_score).to eq(5)
    end
  end

  describe '#lowest_total_score' do
    it 'can return lowest total score of all games' do
      expect(@game_manager.lowest_total_score).to be_a(Integer)
      expect(@game_manager.lowest_total_score).to eq(1)
    end
  end

  describe '#total_games_per_team' do
    it 'can find the total number of games per team' do
      expected = {6=>9, 3=>5, 5=>4, 16=>12, 17=>7, 8=>5, 9=>5, 30=>5, 19=>3, 26=>3}
      expect(@game_manager.total_games_per_team).to eq(expected)
    end
  end

  describe '#total_scores_per_team' do
    it 'can find the total number of scores per team' do
      expected = {6=>18, 3=>8, 5=>8, 16=>24, 17=>11, 8=>13, 9=>10, 30=>8, 19=>6, 26=>1}
      expect(@game_manager.total_scores_per_team).to eq(expected)
    end
  end

  describe '#games_played' do
    it 'can tell you the total number of games played per team_id' do
      expect(@game_manager.games_played(3)).to eq(5)
    end
  end

  describe '#average_goals_per_game' do
    it 'can give the average goals per game for the season' do
      expected = {6=>2.0, 3=>1.6, 5=>2.0, 16=>2.0, 17=>1.5714285714285714, 8=>2.6, 9=>2.0, 30=>1.6, 19=>2.0, 26=>0.3333333333333333}
      expect(@game_manager.average_goals_per_game).to eq(expected)
    end
  end
end