class SeasonManager
  attr_reader :season_path,
              :stat_tracker

  def initialize(season_path, stat_tracker)
    @seasons = []
    @stat_tracker = stat_tracker
    create_leagues(season_path)
  end

  def create_leagues(season_path)
    data = CSV.parse(File.read(season_path), headers: true, header_converters: :symbol)
    @seasons = data.map do |seas|
      Season.new(seas)
    end
  end

  
end