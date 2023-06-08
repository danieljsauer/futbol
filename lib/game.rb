# This class is pulling from games.csv.
# We will need game_id, season, away_team_id, home_team_id, away_goals, 
# home_goals.
class Game
  attr_reader :game_id,
              :season,
              :away_team_id,
              :home_team_id,
              :away_goals,
              :home_goals
  

  def initialize(data)
    @game_id = data['game_id']
    @season = data['season']
    @away_team_id = data['away_team_id']
    @home_team_id = data['home_team_id']
    @away_goals = data['away_goals']
    @home_goals = data['home_goals']
  end
end