require_relative 'cipher_builder'
require_relative 'offset_gen'
require 'pry'

class Crack
  attr_reader :offset

  def initialize
    @offset = OffsetGen.new.generate_offset(4)
    @char_map = Encrypt.new.gen_map
  end

  def crack(message, offset=@offset)
    build_output(message)
  end

  def calc_difference(message)
    chunked_message = CipherBuilder.new.chunk(message.reverse, 6)
    # if message.length % 4 == 0
      encrypted_index = @char_map.index(chunked_message[0][1])
      difference = 37 - encrypted_index
    # elsif message.length % 4 == 1
    #   encrypted_index = @char_map.index(chunked_message[0][2])
    #   difference = @char_map.index('.') - encrypted_index
    # elsif message.length % 4 == 2
    #   encrypted_index = @char_map.index(chunked_message[0][3])
    #   difference = @char_map.index('.') - encrypted_index
    # elsif message.length % 4 == 3
    #   encrypted_index = @char_map.index(chunked_message[0][4])
    #   difference = @char_map.index('.') - encrypted_index
    # end
    # difference
    # binding.pry
  end

  def build_output(message)
    cipher = CipherBuilder.new
    final = []
    cipher.chunk(message.reverse, 4).each do |chunk|
      chunk.each do |char|
        index = @char_map.index(char) + calc_difference(message)
        index -= @char_map.count if index > @char_map.count

        case chunk.index(char)
        when 0
          final << @char_map[index]
        when 1
          final << @char_map[index]
        when 2
          final << @char_map[index]
        when 3
          final << @char_map[index]
        end
      end
    end
      final.join.reverse
      binding.pry
  end
end