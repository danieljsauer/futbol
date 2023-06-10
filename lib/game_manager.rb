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

  def average_goals_per_game
    hash = Hash.new
    total_scores_per_team.each do |team_id, goals|
    hash[team_id] = goals.to_f / games_played(team_id)
    end
    hash
  end
end