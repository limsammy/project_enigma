require_relative 'cipher_builder'
require_relative 'offset_gen'
require 'pry'

class Crack
  attr_reader :offset

  def initialize
    @offset = OffsetGen.new.generate_offset(4)
    @known_string = "..end.."
  end

  def crack(message, offset=@offset)
    message = CipherBuilder.new.chunk(message.reverse, 6)
    known = message[0][1]
    binding.pry
  end
end