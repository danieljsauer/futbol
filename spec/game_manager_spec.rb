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

  describe '#percentage_home_wins' do
    it 'should return the percentage of home wins' do
      expect(@game_manager.percentage_home_wins).to eq(0.72)
    end
  end

  describe '#percentage_visitor_wins' do
    it 'should return the percentage of visitor wins' do
      expect(@game_manager.percentage_visitor_wins).to eq(0.24)
    end
  end

  describe '#percentage_ties' do
    it 'should return the percentage of ties' do
      expect(@game_manager.percentage_ties).to eq(0.03)
    end
  end

  describe '#count_of_games_by_season' do
    it 'should return the number of games per season' do
      expected = {"20122013"=>29}
      expect(@game_manager.count_of_games_by_season).to be_a(Hash)
    end
  end

  describe '#average_goals_per_game' do
    it 'can give the average goals per game for the season' do
      expected = {6=>2.0, 3=>1.6, 5=>2.0, 16=>2.0, 17=>1.57, 8=>2.6, 9=>2.0, 30=>1.6, 19=>2.0, 26=>0.33}
      expect(@game_manager.average_goals_per_game).to eq(expected)
    end
  end

  describe '#average_goals_by_season' do
    it 'can return the average goals scored per season in a hash' do
      expect(@game_manager.average_goals_by_season("20122013")).to eq( {"20122013"=>3.69} )
    end
  end
  
  # ------Helper Method Tests-------

  describe '#total_games' do
    it 'returns the total number of games' do
      expect(@game_manager.total_games).to eq(29)
    end
  end

  describe '#home_wins' do
    it 'retruns a count of the total number of home team wins' do
      expect(@game_manager.home_wins).to eq(21.0)
    end
  end

  describe '#game_ties' do
    it 'retruns a count of the total number of ties' do
      expect(@game_manager.game_ties).to eq(1.0)
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

  describe '#total_goals_by_season(season)' do
    it 'can tell you the total number of goals per season' do
      expect(@game_manager.total_goals_by_season('20122013')).to eq(107)
    end
  end

  describe '#total_games_per_season(season)' do
    it 'returns the total number of games per season' do
      expect(@game_manager.total_games_per_season('20122013')).to eq(29)
    end
  end

  describe '#average_scores_by_season(seaon)' do
    it 'returns the average number of goals per season' do
      expect(@game_manager.average_scores_by_season('20122013')).to eq(3.69)
    end
  end

  describe '#away_team_id' do
    it 'can find away team id' do
      expect(@game_manager.away_team_id.first).to eq(3)
    end
  end

  describe 'home_team_id' do
    it 'can find home team id' do
      expect(@game_manager.home_team_id.first).to eq(6)
    end
  end
end