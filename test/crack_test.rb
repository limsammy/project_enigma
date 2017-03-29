require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/filesystem'
require './lib/crack'

class CrackTest < Minitest::Test
  def test_create_instance_of_crack_class
    crack = Crack.new

    assert_instance_of Crack, crack
  end

  def test_char_map_returns_char_map
    c = Crack.new

    assert_instance_of Array, c.char_map
  end

  def test_offset_returns_offset
    c = Crack.new

    assert_instance_of String, c.offset
  end

  def test_accessor_for_pry
    c = Crack.new
    c.crack('lz0etlzzhnlfflukff')
  end

  def test_rotation_can_get_correct_rotation
    c = Crack.new

    assert_equal 7, c.rotation('lz0etlzzhnlfflukff', -4)
  end

  def test_can_crack_message
    c = Crack.new

    assert_equal "test..end..", c.crack('pi727ctw,cn')
  end

  def test_files_are_created
    c = Crack.new
    c.crack_file('to_decrypt.txt', 'cracked.txt')

    assert_exists './cracked.txt'
  end
end