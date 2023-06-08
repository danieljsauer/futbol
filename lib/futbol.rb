class Futbol
  attr_reader :games,
              :league,
              :season

  def initialize(locations)
    @games = (CSV.open locations[:games], headers: true, header_converters: :symbol).map { |game| Game.new(game) }
    @league = (CSV.open locations[:leagues], headers: true, header_converters: :symbol).map { |league| League.new(league) }
    @season = (CSV.open locations[:seasons], headers: true, header_converters: :symbol).map { |season| Season.new(season) }
  end
end

