require_relative 'key_gen'
require_relative 'offset_gen'
require_relative 'cipher_builder'
require_relative 'encrypt'
require 'pry'

class Decrypt

  def decrypt(message, key, offset)
    # generate cipher tables using CipherBuilder and create_table method
    a_cipher = CipherBuilder.new.create_table('A', key.to_s, offset.to_s)
    b_cipher = CipherBuilder.new.create_table('B', key.to_s, offset.to_s)
    c_cipher = CipherBuilder.new.create_table('C', key.to_s, offset.to_s)
    d_cipher = CipherBuilder.new.create_table('D', key.to_s, offset.to_s)
    final = []
    message = message.chars.each_slice(4).to_a
    message.each do |chunk|
      chunk.each do |char|
        if chunk.index(char) == 0
          final << a_cipher.key(char).to_s
        elsif chunk.index(char) == 1
          final << b_cipher.key(char).to_s
        elsif chunk.index(char) == 2
          final << c_cipher.key(char).to_s
        elsif chunk.index(char) == 3
          final << d_cipher.key(char).to_s
        end
      end
    end
    final.join
    # binding.pry
  end

  def gen_map
    # creates charmap, an array including all those ranges
    [*('a'..'z')] + [*('0'..'9')] + [' ', '.', ',']
  end
end
