require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher_builder'

class CipherBuilderTest < Minitest::Test
  def test_char_map_is_assigned
    builder = CipherBuilder.new

    assert_instance_of Array, builder.char_map
  end

  def test_rotation_a_is_created
    b = CipherBuilder.new
    a_rotation = b.calculate_rotation('A', '03165', '0489')

    assert_equal 3, a_rotation
  end

  def test_rotation_b_is_created
    b = CipherBuilder.new
    b_rotation = b.calculate_rotation('B', '03165', '0489')

    assert_equal 35, b_rotation
  end

  def test_rotation_c_is_created
    b = CipherBuilder.new
    c_rotation = b.calculate_rotation('C', '03165', '0489')

    assert_equal 24, c_rotation
  end

  def test_rotation_d_is_created
    b = CipherBuilder.new
    d_rotation = b.calculate_rotation('D', '03165', '0489')

    assert_equal 74 % 39, d_rotation
  end

  def test_hash_keys_populated_w_charmap # delete later, pry accessor to check table
    # skip
    b = CipherBuilder.new

    b.create_table('A', '03165', '0489')
  end

  def test_chunk_method_returns_array
    c = CipherBuilder.new

    assert_instance_of Array, c.chunk("Test message", 4)
  end

  def test_char_map_is_type_array
    c = CipherBuilder.new

    assert_instance_of Array, c.gen_map
  end

  def test_char_map_is_39_chars_long
    c = CipherBuilder.new

    assert_equal 39, c.gen_map.length
  end
end