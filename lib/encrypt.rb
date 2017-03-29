require_relative 'key_gen'
require_relative 'offset_gen'
require_relative 'cipher_builder'
require 'pry'

class Encrypt

  attr_accessor :key, :offset

  def initialize
    @key      = KeyGen.new.generate_key(5)
    @offset   = OffsetGen.new.generate_offset(4)
  end

  def encrypt(message, key=@key, offset=@offset)
    cipher = CipherBuilder.new
    final = cipher.chunk(message, 4).map!.each do |chunk|
      chunk.map!.with_index do |char, index|
        case index
        when 0
          encrypted_char = cipher.lookup('B', char, key, offset)
          char = encrypted_char
        when 1
          encrypted_char = cipher.lookup('B', char, key, offset)
          char = encrypted_char
        when 2
          encrypted_char = cipher.lookup('C', char, key, offset)
          char = encrypted_char
        when 3
          encrypted_char = cipher.lookup('D', char, key, offset)
          char = encrypted_char
        end
      end
    end
    final.join
  end

  def file_encrypt(input, output)
    file = File.open(input, "r").read
    encrypted = self.encrypt(file)
    output_file = File.open(output, 'w')
    output_file.write(encrypted)
    output_file.close
    puts "Created file #{output.to_s} with key #{@key} and offset #{@offset}"
  end
end

if __FILE__ == $0
  Encrypt.new.file_encrypt(ARGV[0], ARGV[1])
end