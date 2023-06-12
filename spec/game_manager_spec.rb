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

  describe '#create_games' do
    it 'can parse CSV files and creates Game objects' do
      game_path = './fixtures/games.csv'

      # Stub 
      csv_data = [
        { game_id: '1', season: '20192020', away_team_id: '1', home_team_id: '2', away_goals: '3', home_goals: '2' },
        { game_id: '2', season: '20192020', away_team_id: '3', home_team_id: '4', away_goals: '1', home_goals: '0' },
        { game_id: '3', season: '20202021', away_team_id: '1', home_team_id: '4', away_goals: '2', home_goals: '2' }
      ]
      allow(CSV).to receive(:parse).and_return(csv_data)

      @game_manager.create_games(game_path)

      expect(@game_manager.count_of_games_by_season).to eq({"20192020"=>2, "20202021"=>1})
      expect(@game_manager.average_goals_per_game).to eq(3.33)
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
    it 'should return the average goals per game' do
      expect(@game_manager.average_goals_per_game).to eq(3.69)
      
    end
  end

  # describe '#average_goals_per_game' do
  #   it 'can give the average goals per game for the season' do
  #     expected = {6=>2.0, 3=>1.6, 5=>2.0, 16=>2.0, 17=>1.57, 8=>2.6, 9=>2.0, 30=>1.6, 19=>2.0, 26=>0.33}
  #     expect(@game_manager.average_goals_per_game).to eq(expected)
  #   end
  # end

  describe '#average_goals_by_season' do
    it 'can return the average goals scored per season in a hash' do
      expect(@game_manager.average_goals_by_season).to eq( {"20122013"=>3.69} )
    end
  end
  
  # ------Helper Method Tests-------

  describe '#total_games' do
    it 'returns the total number of games' do
      expect(@game_manager.total_games).to eq(29)
    end
  end

  describe '#total_away_games(team_id)' do
    it 'can count the number of away games per team' do
      expect(@game_manager.total_away_games(6)).to eq(4)
    end
  end

  describe '#total_home_games(team_id)' do
    it 'can count the number of home games per team' do
      expect(@game_manager.total_home_games(3)).to eq(2)
    end
  end

  describe '#home_wins' do
    it 'retruns a count of the total number of home team wins' do
      expect(@game_manager.home_wins).to eq(21.0)
    end
  end

  describe '#visitor_wins' do
    it 'returns a count of the total number of away team wins' do
      expect(@game_manager.visitor_wins).to eq(7.0)
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

  describe '#average_scores_by_season(season)' do
    it 'returns the average number of goals per season' do
      expect(@game_manager.average_scores_by_season('20122013')).to eq(3.69)
    end
  end

  describe '#away_team_id' do
    it 'can find away team id' do
      expect(@game_manager.away_team_id.first).to eq(3)
    end
  end

  describe '#home_team_id' do
    it 'can find home team id' do
      expect(@game_manager.home_team_id.first).to eq(6)
    end
  end

  describe '#average_scores_by_team' do
    it 'can tell the average score per team' do
      expect(@game_manager.average_scores_by_team).to eq({6=>1, 3=>3, 5=>3, 16=>1, 17=>2, 8=>2, 9=>2, 30=>3, 19=>4, 26=>29})
    end
  end

  describe '#away_goals_with_team_id' do
    it 'can create a hash with away team id as key and away goals has value' do
      expect(@game_manager.away_goals_with_team_id).to eq({3=>5.0, 6=>12.0, 5=>1.0, 17=>5.0, 16=>8.0, 9=>7.0, 8=>3.0, 30=>4.0, 26=>2.0, 19=>0.0})
    end
  end

  describe '#home_goals_with_team_id' do
    it 'can create a hash with home team id as key and home goals has value' do
      expect(@game_manager.home_goals_with_team_id).to eq({6=>12.0, 3=>3.0, 5=>1.0, 16=>15.0, 17=>8.0, 8=>6.0, 9=>7.0, 30=>3.0, 19=>4.0, 26=>1.0})
    end
  end

  describe '#visitor_average_total_scores' do
    it 'can return a hash with visitor team id as key and their average score as value' do
      expect(@game_manager.visitor_average_total_scores).to eq({3=>1.67, 6=>3.0, 5=>0.5, 17=>1.25, 16=>1.6, 9=>2.33, 8=>1.5, 30=>1.33, 26=>1.0, 19=>0.0})
    end
  end

  describe '#home_average_total_scores' do
    it 'can return a hash with home team id as key and their average score as value' do
      expect(@game_manager.home_average_total_scores).to eq({6=>2.4, 3=>1.5, 5=>0.5, 16=>2.14, 17=>2.67, 8=>2.0, 9=>3.5, 30=>1.5, 19=>2.0, 26=>1.0})
    end
  end
end