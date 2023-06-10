class LeagueManager
  attr_reader :team_path,
              :stat_tracker

  def initialize(team_path, stat_tracker)
    @league = []
    @stat_tracker = stat_tracker
    create_leagues(team_path)
  end

  def create_leagues(team_path)
    data = CSV.parse(File.read(team_path), headers: true, header_converters: :symbol)
    @league = data.map do |leag|
      League.new(leag)
    end
  end

  def count_of_teams
    @league.count
  end

  def best_offense
    @league.find { |team| team.team_id == most_wins_team_id }.team_name
  end

  def worst_offense
    @league.find { |team| team.team_id == most_losses_team_id }.team_name
  end

  # helper methods
  def most_wins_team_id
    @stat_tracker.average_goals_per_game.max_by { |id, goals| goals }[0]
  end

  def most_losses_team_id
    @stat_tracker.average_goals_per_game.min_by { |id, goals| goals }[0]
  end
end