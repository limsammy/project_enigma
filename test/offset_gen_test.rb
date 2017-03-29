require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_gen'

class OffsetGenTest < Minitest::Test
  def test_object_is_created
    gen = OffsetGen.new

    assert_instance_of OffsetGen, gen
  end

  def test_object_is_created_with_default_length_4
    gen = OffsetGen.new

    assert_equal 4, gen.length
  end

  def test_length_can_be_changed_to_something_other_than_5
    gen = OffsetGen.new
    gen.length = 2

    assert_equal 2, gen.length
  end

  def test_generate_offset_method_generates_offset_default_length_5
    gen = OffsetGen.new
    offset = gen.generate_offset

    assert_equal 4, offset.to_s.length
  end
end
