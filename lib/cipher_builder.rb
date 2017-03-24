require_relative 'encrypt'
require 'pry'

class CipherBuilder
  attr_reader :char_map

  def initialize
    @char_map = Encrypt.new.gen_map
  end

  def calculate_rotation(rotation_id, key, offset)
    if rotation_id == 'A'
      key[0..1].to_i + offset[0].to_i
    elsif rotation_id == 'B'
      key[1..2].to_i + offset[1].to_i
    elsif rotation_id == 'C'
      key[2..3].to_i + offset[2].to_i
    elsif rotation_id == 'D'
      key[3..4].to_i + offset[3].to_i
    else
      puts "No rotation of type #{rotation} exists."
    end
  end

  def create_table(rotation_id, key, offset)
    keys = @char_map
    vals = @char_map.rotate(calculate_rotation(rotation_id, key, offset))
    table = Hash[keys.zip(vals)]
    table
  end
end