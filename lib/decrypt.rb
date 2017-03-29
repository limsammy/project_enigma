require_relative 'key_gen'
require_relative 'offset_gen'
require_relative 'cipher_builder'
require_relative 'encrypt'
require 'pry'

class Decrypt

  def decrypt(message, key, offset)
    cipher = CipherBuilder.new
    final = cipher.chunk(message, 4).map!.each do |chunk|
      chunk.map!.with_index do |char, index|
        if index == 0
          encrypted_char = cipher.lookup_key('B', char, key, offset)
          char = encrypted_char
        elsif index == 1
          encrypted_char = cipher.lookup_key('B', char, key, offset)
          char = encrypted_char
        elsif index == 2
          encrypted_char = cipher.lookup_key('C', char, key, offset)
          char = encrypted_char
        elsif index == 3
          encrypted_char = cipher.lookup_key('D', char, key, offset)
          char = encrypted_char
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
# binding.pry
""
