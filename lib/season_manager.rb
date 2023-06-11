class SeasonManager
  attr_reader :seasons,
              :season_path,
              :stat_tracker

  def initialize(season_path, stat_tracker)
    @seasons = []
    @stat_tracker = stat_tracker
    create_leagues(season_path)
  end

  def create_managers(season_path)
    data = CSV.parse(File.read(season_path), headers: true, header_converters: :symbol)
    @seasons = data.map do |seas|
      Season.new(seas)
    end
  end

  def best_coach(season)
    require 'pry'; binding.pry
    # this method will take an argument of season.
    # we will then need to iterate through each season and find the team with the most wins.
    # we will also need to iterate through a season with a team id and find total games played by each team.
    # we will then need to divide total wins by each team by total games by each team.
    # we will return the team id with the highest percentage.
    # we will then take that team id and match it with the coach of that team.
  end
end