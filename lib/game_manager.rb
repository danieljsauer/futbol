class GameManager 
  attr_reader :games,
              :game_path,
              :stat_tracker

  def initialize(game_path, stat_tracker)
    @games = []
    @stat_tracker = stat_tracker
    create_games(game_path)
  end

  def create_games(game_path)
    data = CSV.parse(File.read(game_path), headers: true, header_converters: :symbol)
    @games = data.map do |game|
      Game.new(game)
    end
  end

  def highest_total_score
    @games.max_by do |game|
      game.total_score
    end.total_score
  end

  def lowest_total_score
    @games.min_by do |game|
      game.total_score
    end.total_score
  end

  def percentage_home_wins
    (home_wins / total_games).round(2)
  end

  def percentage_visitor_wins
    (visitor_wins / total_games).round(2)
  end

  def percentage_ties
    (game_ties / total_games).round(2)
  end

  def count_of_games_by_season
    game_count = Hash.new(0)
    @games.map do |game|
      game_count[game.season] += 1
    end
    game_count
  end
  
  def average_goals_per_game
    hash = Hash.new
    total_scores_per_team.each do |team_id, goals|
      hash[team_id] = (goals.to_f / games_played(team_id)).round(2)
    end
    hash
  end

  def average_goals_by_season(season)
    avg_goals = Hash.new(0)
    @games.each do |game|
      avg_goals[game.season] = average_scores_by_season(season)
    end
    avg_goals
  end

# -------Helper Methods-------

  def total_games
    @games.count
  end

  def home_wins
    @games.count do |game|
      game.home_goals > game.away_goals
    end.to_f
  end

  def visitor_wins
    @games.count do |game|
      game.away_goals > game.home_goals
    end.to_f
  end

  def game_ties
    @games.count do |game|
      game.away_goals == game.home_goals
    end.to_f
  end

  def total_games_per_team
    @games.each_with_object(Hash.new(0)) do |game, hash|
      hash[game.home_team_id] += 1
      hash[game.away_team_id] += 1
    end
  end

  def total_scores_per_team
    @games.each_with_object(Hash.new(0)) do |game, hash|
      hash[game.home_team_id] += game.home_goals
      hash[game.home_team_id] += game.away_goals
    end
  end

  def games_played(team_id)
    total_games_per_team[team_id]
  end

  def total_goals_by_season(season)
    @games.sum do |game|
      if game.season == season
        game.home_goals + game.away_goals
      end
    end
  end

  def total_games_per_season(season)
    @games.count do |game|
      if game.season == season
        game.game_id
      end
    end
  end

  def average_scores_by_season(season)
    (total_goals_by_season(season).to_f / total_games_per_season(season)).round(2)
  end

  def away_team_id
    @games.map do |game|
      game.away_team_id
    end
  end
end