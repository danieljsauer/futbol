require 'csv'
# require_relative './game'
# require_relative './league'
# require_relative './season'
require_relative './game_manager'
require_relative './season_manager'
require_relative './league_manager'
class StatTracker
  attr_reader :game_manager,
              :league_manager,
              :season_manager,
              :game,
              :league,
              :season
              

  def initialize(locations)
    create_managers(locations)
  end

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def create_managers(locations)
    @game_manager = GameManager.new(locations[:games], self)
    @league_manager = LeagueManager.new(locations[:teams], self)
    @season_manager = SeasonManager.new(locations[:game_teams], self)
  end

  # Game Manager Methods

  def highest_total_score
    @game_manager.highest_total_score
  end

  def lowest_total_score
    @game_manager.lowest_total_score
  end

  def percentage_home_wins
    @game_manager.percentage_home_wins
  end

  def percentage_visitor_wins
    @game_manager.percentage_visitor_wins
  end

  def percentage_ties
    @game_manager.percentage_ties
  end

  def count_of_games_by_season
    @game_manager.count_of_games_by_season
  end

  def average_goals_per_game
    @game_manager.average_goals_per_game
  end

  def average_goals_per_game
    @game_manager.average_goals_per_game
  end

  def average_goals_by_season
    @game_manager.average_goals_by_season
  end

  # ----Helper Methods----

  def total_games
    @game_manager.total_games
  end

  def home_wins
    @game_manager.home_wins
  end

  def visitor_wins
    @game_manager.visitor_wins
  end

  def game_ties
    @game_manager.game_ties
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

  def total_goals_per_season
    @game_manager.total_goals_per_season
  end

  def total_games_per_season
    @game_manager.total_games_per_season
  end

  def average_scores_by_season
    @game_manager.average_scores_by_season
  end

  def away_team_id
    @game_manager.away_team_id
  end

  def home_team_id
    @game_manager.home_team_id
  end

  def average_scores_by_team
    @game_manager.average_scores_by_team
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
  
  def lowest_scoring_visitor
    @league_manager.lowest_scoring_visitor
  end

  def lowest_scoring_home_team
    @league_manager.lowest_scoring_home_team
  end

  # helper methods
  def find_team_id_with_name
    @league_manager.find_team_name
  end
end