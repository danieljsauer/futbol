class LeagueManager
  attr_reader :team_path,
              :stat_tracker

  def initialize(team_path, stat_tracker)
    @league = []
    @stat_tracker = stat_tracker
    create_league(team_path)
  end

  def create_league(team_path)
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

  def highest_scoring_visitor
    goals = @stat_tracker.visitor_average_total_scores.max_by { |team_id, goals| goals }
    find_team_id_with_name[goals[0]]
  end

  def highest_scoring_home_team
    goals = @stat_tracker.home_average_total_scores.max_by { |team_id, goals| goals }
    find_team_id_with_name[goals[0]]
  end

  def lowest_scoring_visitor
    goals = @stat_tracker.visitor_average_total_scores.min_by { |team_id, goals| goals }
    find_team_id_with_name[goals[0]]
  end

  def lowest_scoring_home_team
    goals = @stat_tracker.home_average_total_scores.min_by { |team_id, goals| goals }
    find_team_id_with_name[goals[0]]
  end

 # -------Helper Methods-------
 
  def most_wins_team_id
    @stat_tracker.average_goals_per_game.max_by { |id, goals| goals }[0]
  end

  def most_losses_team_id
    @stat_tracker.average_goals_per_game.min_by { |id, goals| goals }[0]
  end

  def find_team_id_with_name
    id_and_name = Hash.new
    @league.each do |leag|
      id_and_name[leag.team_id] = leag.team_name
    end
    id_and_name
  end
end