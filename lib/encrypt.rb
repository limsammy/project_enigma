require_relative 'key_gen'

class Encrypt

  attr_accessor :key,

  def initialize
    # assign random 5 digits to instance variable @key
    @key = KeyGen.generate_key(5)
    # assign todays date in ddmmyy format as default offset
    @offset = OffsetGen.new.generate_offset(4)
  end

  def encrypt(message, key=@key, offset=@offset)
    char_map = map

    # create class that builds cipher tables
    # create method(or class?) to calculate rotation
  end

  def map
    [*('a'..'z')]+[*('0'..'9')]+[' ', '.', ',']
  end
end