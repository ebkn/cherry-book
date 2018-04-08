require 'rspec'
require './lib/team'
require './lib/bank'

RSpec.describe '#deep_freeze' do
  example 'deep_freeze' do
    expect(Team::COUNTRIES).to eq(['Japan', 'US', 'India'])
    expect(Team::COUNTRIES.frozen?).to be_truthy
    Team::COUNTRIES.each { |country| expect(country.frozen?).to be_truthy }
  end
end
