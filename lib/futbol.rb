class Futbol
  attr_accessor :games

  attr_reader :league,
              :season

  def initialize(locations)
    @games = (CSV.open locations[:games], headers: true, header_converters: :symbol).map { |game| Game.new(game) }
    @league = (CSV.open locations[:leagues], headers: true, header_converters: :symbol).map { |league| League.new(league) }
    @season = (CSV.open locations[:seasons], headers: true, header_converters: :symbol).map { |season| Season.new(season) }
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

