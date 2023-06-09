require 'csv'
require_relative 'game'
require_relative 'league'
require_relative 'season'

class StatTracker
    attr_reader :locations

  def initialize(locations)
    @locations = locations
  end

  def self.from_csv(locations)
    games_data = CSV.open(locations[:games], headers: true, header_converters: :symbol)
    leagues_data = CSV.open(locations[:teams], headers: true, header_converters: :symbol)
    seasons_data = CSV.open(locations[:game_teams], headers: true, header_converters: :symbol)
  
    games = games_data.map { |game| Game.new(game) }
    leagues = leagues_data.map { |league| League.new(league) }
    seasons = seasons_data.map { |season| Season.new(season) }
  
    StatTracker.new(games: games, league: leagues, season: seasons)
  end

  def access_game_and_game_teams
    @games.map! do |game|
      @season.each do |seas|
        if seas.game_id == game.game_id
          if seas.home_or_away == 'home'
            game.game_id = seas.game_id
            game.home_team_id = seas.team_id
            game.home_goals = seas.goals
          elsif seas.home_or_away == 'away'
            game.game_id = seas.game_id
            game.away_team_id = seas.team_id
            game.away_goals = seas.goals
          end
        end
      end
      game
    end
  end

  def access_league_and_game_and_game_teams
    @games.map! do |game|
      @league.each do |leag|
        if leag.team_id == game.home_team_id
          game.home_team_id = leag.team_id
          game.home_team_name = leag.team_name
        elsif leag.team_id == game.away_team_id
          game.away_team_id = leag.team_id
          game.away_team_name = leag.team_name
        end
      end
      game
    end
  end
end
