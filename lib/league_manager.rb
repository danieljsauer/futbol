require_relative 'Futbol'

class LeagueManager < Futbol
  attr_reader :

  def initialize(locations)
    super(locations)
  end
end