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
    final = []
    cipher.chunk(message, 4).each do |chunk|
      chunk.each do |char|
        if chunk.index(char) == 0
          final << cipher.lookup('A', char, key, offset)
        elsif chunk.index(char) == 1
          final << cipher.lookup('B', char, key, offset)
        elsif chunk.index(char) == 2
          final << cipher.lookup('C', char, key, offset)
        elsif chunk.index(char) == 3
          final << cipher.lookup('D', char, key, offset)
        end
      end
      final.join
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
