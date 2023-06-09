class LeagueManager
  attr_reader :game_path,
              :stat_tracker

  def initialize(game_path, stat_tracker)
    @league = []
    @stat_tracker = stat_tracker
    create_leagues(game_path)
  end

  def create_leagues(game_path)
    data = CSV.parse(File.read(game_path), headers: true, header_converters: :symbol)
    @league = data.map do |leag|
      League.new(leag)
    end
  end

  def count_of_teams
    
  end
end