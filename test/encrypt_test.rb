require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test
  def test_object_is_class_type
    e = Encrypt.new

    assert_instance_of Encrypt, e
  end

  def test_object_is_created_with_default_key_length_5
    e = Encrypt.new

    assert_equal 5, e.key.to_s.length
  end

  def test_object_is_created_with_default_offset_length_4
    e = Encrypt.new

    assert_equal 4, e.offset.to_s.length
  end

  def test_char_map_is_39_chars_long
    e = Encrypt.new

    assert_equal 39, e.gen_map.length
  end

  def test_char_map_is_type_array
    e = Encrypt.new

    assert_instance_of Array, e.gen_map
  end

  # def test_encrypt_accessor_for_pry
  #   e = Encrypt.new
  #
  #   e.encrypt('this is a test message')
  # end
end
