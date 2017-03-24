require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_gen'

class KeyGenTest < Minitest::Test
  def test_object_is_created
    gen = KeyGen.new

    assert_instance_of KeyGen, gen
  end

  def test_object_is_created_with_default_length_5
    gen = KeyGen.new

    assert_equal 5, gen.length
  end

  def test_length_can_be_changed_to_something_other_than_5
    gen = KeyGen.new
    gen.length = 10

    assert_equal 10, gen.length
  end

  def test_generate_key_generates_key_default_length_5
    gen = KeyGen.new
    key = gen.generate_key

    assert_equal 5, key.to_s.length
  end
end