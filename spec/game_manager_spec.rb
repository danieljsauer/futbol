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
end