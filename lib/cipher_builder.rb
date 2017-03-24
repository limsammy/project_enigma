require_relative 'encrypt'

class CipherBuilder
  attr_reader :char_map

  def initialize
    @char_map = Encrypt.new.gen_map
  end
  # create class that builds HASH cipher tables for each ABCD rotation
  # create method(or class?) to calculate rotation
end