# This class will pull from game_teams.csv.
# We need game_id, team_id, HoA, result, head_coach, goals, shots, tackles.
class Season
  attr_reader :game_id,
              :team_id,
              :HoA,
              :result,
              :head_coach,
              :goals,
              :shots,
              :tackles

  def initialize(data)
    @game_id = data[:game_id]
    @team_id = data[:team_id]
    @HoA = data[:HoA]
    @result = data[:result]
    @head_coach = data[:head]
    @goals = data[:goals]
    @shots = data[:shots]
    @tackles = data[:tackles]
  end
end

