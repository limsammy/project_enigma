require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'

class CrackTest < Minitest::Test
  def test_create_instance_of_crack_class
    crack = Crack.new

    assert_instance_of Crack, crack
  end

  def test_accessor_for_pry
    c = Crack.new
    c.crack('test message here..end..')
  end
end