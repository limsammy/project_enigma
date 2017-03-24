gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher_builder'

class CipherBuilderTest < Minitest::Test
  def test_char_map_is_assigned
    builder = CipherBuilder.new

    assert_instance_of Array, builder.char_map
  end
end