# This class will pull from game_teams.csv.
# We need game_id, team_id, HoA, result, head_coach, goals, shots, tackles.
class Season
  attr_reader :game_id,
              :team_id,
              :home_or_away,
              :result,
              :head_coach,
              :goals,
              :shots,
              :tackles

  def initialize(data)
    @game_id = data[:game_id]
    @team_id = data[:team_id]
    @home_or_away = data[:hoa] 
    @result = data[:result]
    @head_coach = data[:head_coach]
    @goals = data[:goals]
    @shots = data[:shots]
    @tackles = data[:tackles]
  end
end


#----Helper Methods----

def coach_wins_(season)
  # I need to return the name of the coach with the best win percentage per season.
  # I need to iterate of each season find the team with the best win percentage.
  # then call on that coach.
  require 'pry'; binding.pry
end