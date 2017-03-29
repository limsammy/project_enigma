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

  def test_can_encrypt
    e = Encrypt.new
    message = 'hello world'

    assert_instance_of String, e.encrypt("hello world")
  end
end
