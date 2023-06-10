class StatTracker
  attr_reader :game,
              :league,
              :season

  def initialize(locations)
    
    create_managers(locations)
  end

  def self.from_csv(locations)
    @stat_tracker = StatTracker.new(@locations)
    
  end

  def create_managers(locations)
    @game_manager = GameManager.new(locations[:games], self)
  end

  # Game Manager Methods

  def highest_total_score
    @game_manager.highest_total_score
  end

  def lowest_total_score
    @game_manager.lowest_total_score
  end
end