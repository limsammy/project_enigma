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
    # generate cipher tables using CipherBuilder and create_table method
    a_cipher = CipherBuilder.new.create_table('A', @key.to_s, @offset.to_s)
    b_cipher = CipherBuilder.new.create_table('B', @key.to_s, @offset.to_s)
    c_cipher = CipherBuilder.new.create_table('C', @key.to_s, @offset.to_s)
    d_cipher = CipherBuilder.new.create_table('D', @key.to_s, @offset.to_s)
    final = []
    chunk(message).each do |chunk|
      chunk.each do |char|
        if chunk.index(char) == 0
          final << a_cipher[char].to_s
        elsif chunk.index(char) == 1
          final << b_cipher[char].to_s
        elsif chunk.index(char) == 2
          final << c_cipher[char].to_s
        elsif chunk.index(char) == 3
          final << d_cipher[char].to_s
        end
      end
    end
    return "Your encrypted message is '#{final.join}', encrypted with key: #{@key} and offset: #{@offset}"
    # binding.pry
  end

  def chunk(message)
    message.chars.each_slice(4).to_a
  end

  def gen_map
    # creates charmap, an array including all those ranges
    [*('a'..'z')] + [*('0'..'9')] + [' ', '.', ',']
  end
end
