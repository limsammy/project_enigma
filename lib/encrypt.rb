require_relative 'key_gen'
require_relative 'offset_gen'
require_relative 'cipher_builder'
require 'pry'

class Encrypt

  attr_accessor :key, :offset

  def initialize
    # assign random 5 digits to instance variable ;@key
    @key      = KeyGen.new.generate_key(5)
    # assign todays date in ddmmyy format as default offset
    @offset   = OffsetGen.new.generate_offset(4)
  end

  def encrypt(message, key=@key, offset=@offset)
    cipher = CipherBuilder.new
    chunk(message).each do |chunk|
      chunk.each do |char|
        if chunk.index(char) == 0
          cipher.lookup('A', char, key, offset)
        elsif chunk.index(char) == 1
          cipher.lookup('A', char, key, offset)
        elsif chunk.index(char) == 2
          cipher.lookup('A', char, key, offset)
        elsif chunk.index(char) == 3
          cipher.lookup('A', char, key, offset)
        end
      end
    end
    return "Your encrypted message is '#{cipher.final}', encrypted with key: #{@key} and offset: #{@offset}"
  end

  def chunk(message)
    message.chars.each_slice(4).to_a
  end

  def gen_map
    # creates charmap, an array including all those ranges
    [*('a'..'z')] + [*('0'..'9')] + [' ', '.', ',']
  end
end
