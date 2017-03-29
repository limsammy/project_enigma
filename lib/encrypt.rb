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
    final = cipher.chunk(message, 4).map!.each do |chunk|
      chunk.map!.with_index do |char, index|
        if index == 0
          encrypted_char = cipher.lookup('B', char, key, offset)
          char = encrypted_char
        elsif index == 1
          encrypted_char = cipher.lookup('B', char, key, offset)
          char = encrypted_char
        elsif index == 2
          encrypted_char = cipher.lookup('C', char, key, offset)
          char = encrypted_char
        elsif index == 3
          encrypted_char = cipher.lookup('D', char, key, offset)
          char = encrypted_char
        end
      end
    end
    return "Your encrypted message is '#{final.join}', encrypted with key: #{@key} and offset: #{@offset}"
  end

  def gen_map
    # creates charmap, an array including all those ranges
    [*('a'..'z')] + [*('0'..'9')] + [' ', '.', ',']
  end

  def file_encrypt(filename)
    file = File.open(filename, "r").read
    encrypted = self.encrypt(file)
    output = File.open('encrypted.txt', 'w')
    output.write(encrypted)
    output.close
    puts "Created file 'encrypted.txt' with key #{@key} and offset #{@offset}"
  end
end
