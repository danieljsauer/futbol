class LeagueManager
  attr_reader :team_path,
              :stat_tracker,
              :games

  def initialize(team_path, stat_tracker, games)
    @league = []
    @stat_tracker = stat_tracker
    @games = games
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
    # key is team id, value is score
    total_scores_per_team = Hash.new(0)
    # key is team id, value is number of games
    total_games_per_team = Hash.new(0)
    
    @games.each do |game|
      total_scores_per_team[game.home_team_id] += game.home_goals
      total_scores_per_team[game.home_team_id] += game.away_goals
      
      total_games_per_team[game.home_team_id] += 1
      total_games_per_team[game.away_team_id] += 1
    end

    average_goals_per_game = Hash.new
    total_scores_per_team.each do |id, goals|
      games_played = total_games_per_team[id]
      average_goals_per_game[id] = goals.to_f / games_played
    end

    most_wins_team_id = average_goals_per_game.max_by { |id, goals| goals }[0]
    best_team = @league.find { |team| team.team_id == most_wins_team_id }
    best_team.team_name
  end

  def worst_offense
    # key is team id, value is score
    total_scores_per_team = Hash.new(0)
    # key is team id, value is number of games
    total_games = Hash.new(0)

    @games.each do |game|
      total_scores_per_team[game.home_team_id] += game.home_goals
      total_scores_per_team[game.home_team_id] += game.away_goals

      total_games[game.home_team_id] += 1
      total_games[game.away_team_id] += 1
    end

    average_goals_per_game = Hash.new
    total_scores_per_team.each do |id, goals|
      games_played = total_games[id]
      average_goals_per_game[id] = goals.to_f / games_played
    end

    most_losses_team_id = average_goals_per_game.min_by { |id, goals| goals }[0]
    worst_team = @league.find { |team| team.team_id == most_losses_team_id }
    worst_team.team_name
  end
end