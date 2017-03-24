require_relative 'encrypt'

class CipherBuilder
  attr_reader :char_map

  def initialize
    @char_map = Encrypt.new.gen_map
  end
  # rotation calculator
  def calculate_rotation(rotation_id, key, offset)
    if rotation_id == 'A'
      a_rotation = key[0..1].to_i + offset[0].to_i
    elsif rotation_id == 'B'
      b_rotation = key[1..2].to_i + offset[1].to_i
    elsif rotation_id == 'C'
      c_rotation = key[2..3].to_i + offset[2].to_i
    elsif rotation_id == 'D'
      d_rotation_id = key[3..4].to_i + offset[3].to_i
    else
      puts "No rotation of type #{rotation} exists."
    end
  end
end