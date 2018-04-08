require 'minitest/autorun'
require './lib/team'
require './lib/bank'

class DeepFreezableTest < Minitest::Test
  def test_deep_freeze
    assert_equal ['Japan', 'US', 'India'], Team::COUNTRIES
    assert Team::COUNTRIES.frozen?
    assert Team::COUNTRIES.all? { |country| country.frozen? }
  end
end
