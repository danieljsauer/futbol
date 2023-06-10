class StatTracker
  attr_reader :game,
              :league,
              :season

  def initialize(locations)
    
    create_managers(locations)
  end

  def self.from_csv(locations)
    @stat_tracker = StatTracker.new(@locations)
    
  end

  def create_managers(locations)
    @game_manager = GameManager.new(locations[:games], self)
  end

  # Game Manager Methods

  def highest_total_score
    @game_manager.highest_total_score
  end

  def lowest_total_score
    @game_manager.lowest_total_score
  end

  def total_games_per_team
    @game_manager.total_games_per_team
  end

  def total_scores_per_team
    @game_manager.total_games_per_team
  end

  def games_played(team_id)
    @game_manager.games_played(team_id)
  end

  def average_goals_per_game
    @game_manager.average_goals_per_game
  end

  # League Manager Methods
  
  def count_of_teams
    @league_manager.count_of_teams
  end

  def best_offense
    @league_manager.best_offense
  end

  def worst_offense
    @league_manager.worst_offense
  end
end