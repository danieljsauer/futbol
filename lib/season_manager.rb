require_relative 'Futbol'

class SeasonManager < Futbol
  attr_reader :

  def initialize(locations)
    super(locations)
  end
end