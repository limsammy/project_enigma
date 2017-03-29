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
        case index
        when 0
          encrypted_char = cipher.lookup_key('B', char, key, offset)
          char = encrypted_char
        when 1
          encrypted_char = cipher.lookup_key('B', char, key, offset)
          char = encrypted_char
        when 2
          encrypted_char = cipher.lookup_key('C', char, key, offset)
          char = encrypted_char
        when 3
          encrypted_char = cipher.lookup_key('D', char, key, offset)
          char = encrypted_char
        end
      end
    end
    final.join
  end

  def file_decrypt(input, output, key, offset)
    file = File.open(input, "r").read
    decrypted = self.decrypt(file, key, offset)
    output_file = File.open(output, 'w')
    output_file.write(decrypted)
    output_file.close
    puts "Created file '#{output.to_s} with key #{key} and offset #{offset}"
  end
end

if __FILE__ == $0
  Decrypt.new.file_decrypt(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
end
