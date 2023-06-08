require 'spec_helper'

RSpec.describe Futbol do
  before(:each) do
    game_path = './fixtures/games.csv'
    league_path = './fixtures/teams.csv'
    season_path = './fixtures/game_teams.csv'

locations = {
          games: game_path,
          leagues: league_path,
          seasons: season_path
          }

    @futbol = Futbol.new(locations)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@futbol).to be_a(Futbol)
    end

    it 'can read CSV paths' do
      expect(@futbol.games[1]).to be_a(Game)
      expect(@futbol.league[1]).to be_a(League)
      expect(@futbol.season[1]).to be_a(Season)
    end
  end
end