require_relative 'key_gen'
require_relative 'offset_gen'
require_relative 'cipher_builder'
require 'pry'
require 'enumerator'

class Encrypt

  attr_accessor :key, :offset

  def initialize
    # assign random 5 digits to instance variable @key
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
    # rotate A indices first, then B, etc.
    # Brainstorm way to check if index is ABC or D
    # split array into 4 partitions, assign each partition to ABCD
    #####.each_slice requires enumerator module ask how to use
    # enum = Enumerator.new
    # message = message.each_slice(4) { |a| p a }
    binding.pry
  end

  def gen_map
    # creates charmap, an array including all those ranges
    [*('a'..'z')]+[*('0'..'9')]+[' ', '.', ',']
  end
end