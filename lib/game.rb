# This class is pulling from games.csv.
# We will need game_id, season, away_team_id, home_team_id, away_goals, 
# home_goals.
class Game
  attr_reader :game_id,
              :season,
              :type,
              :date_time,
              :away_team_id,
              :home_team_id,
              :away_goals,
              :home_goals,
              :venue,
              :venue_link

  
  def initialize(data)
    @game_id = data[:game_id]
    @season = data[:season]
    @type = data[:type]
    @date_time = data[:data_time]
    @away_team_id = data[:away_team_id].to_i
    @home_team_id = data[:home_team_id].to_i
    @away_goals = data[:away_goals].to_i
    @home_goals = data[:home_goals].to_i
    @venue = data[:venue]
    @venue_lin = data[:venue_link]
  end

  def total_score
    @home_goals + @away_goals
  end
end