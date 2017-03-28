require_relative 'key_gen'
require_relative 'offset_gen'
require_relative 'cipher_builder'
require_relative 'encrypt'
require 'pry'

class Decrypt

  def decrypt(message, key, offset)
    cipher = CipherBuilder.new
    final = []
    cipher.chunk(message, 4).each do |chunk|
      chunk.each do |char|
        if chunk.index(char) == 0
          final << cipher.lookup_key('A', char, key, offset)
        elsif chunk.index(char) == 1
          final << cipher.lookup_key('B', char, key, offset)
        elsif chunk.index(char) == 2
          final << cipher.lookup_key('C', char, key, offset)
        elsif chunk.index(char) == 3
          final << cipher.lookup_key('D', char, key, offset)
        end
      end
    end
    final.join
  end

  def gen_map
    # creates charmap, an array including all those ranges
    [*('a'..'z')] + [*('0'..'9')] + [' ', '.', ',']
  end

  def file_decrypt(filename, key, offset)
    file = File.open(filename, "r").read
    decrypted = self.decrypt(file, key, offset)
    output = File.open('decrypted.txt', 'w')
    output.write(decrypted)
    output.close
    puts "Created file 'decrypted.txt' with key #{key} and offset #{offset}"
  end
end
binding.pry
""
