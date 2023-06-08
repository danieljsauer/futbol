class GameManager
  attr_reader :location,
              :stat_tracker

  def initialize(location, stat_tracker)
    @location = location
    @stat_tracker = stat_tracker
  end
end