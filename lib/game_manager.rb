class GameManager 
  attr_reader :game_path,
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
end