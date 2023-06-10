# THis class will pull from teams.csv
# We need team_id and team_name.
class League
  attr_reader :team_id,
              :team_name

  def initialize(data)
    @team_id = data[:team_id].to_i 
    @team_name = data[:teamname]
  end
end