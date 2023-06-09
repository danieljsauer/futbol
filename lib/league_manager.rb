class LeagueManager
  attr_reader :team_path,
              :stat_tracker

  def initialize(team_path, stat_tracker)
    @league = []
    @stat_tracker = stat_tracker
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
end