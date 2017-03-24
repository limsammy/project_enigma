require_relative 'key_gen'
require_relative 'offset_gen'

class Encrypt

  attr_accessor :key, :offset

  def initialize
    # assign random 5 digits to instance variable @key
    @key = KeyGen.new.generate_key(5)
    # assign todays date in ddmmyy format as default offset
    @offset = OffsetGen.new.generate_offset(4)
  end

  def encrypt(message, key=@key, offset=@offset)
    char_map = map
  end

  def gen_map
    [*('a'..'z')]+[*('0'..'9')]+[' ', '.', ',']
  end
end