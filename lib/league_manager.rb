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

  def highest_scoring_visitor
    return best_offense if @stat_tracker.away_team_id
  end

  def highest_scoring_home_team
    return worst_offense if @stat_tracker.home_team_id
  end

  def lowest_scoring_visitor
    min_id = @stat_tracker.average_scores_by_team.values.min 
    
    find_team_id_with_name[min_id]
  end

  # helper methods
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