gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_gen'

class KeyGenTest < Minitest::Test
  def test_object_is_created_with_default_length_5
    gen = KeyGen.new

    assert_equal 5, gen.length
  end
end