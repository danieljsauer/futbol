require 'spec_helper'

RSpec.describe League do
  before(:each) do
    @league = League.new(
                        team_id: '8',
                        teamname:'AFC Richmond'
                        )
  end

  describe '#initialize' do
    it '#exists' do
      expect(@league).to be_a(League)
    end

    it 'has readable attributes' do
      expect(@league.team_id).to eq('8')
      expect(@league.team_name).to eq('AFC Richmond')
    end
  end
end