require_relative 'encrypt'
require 'pry'

class CipherBuilder
  attr_reader :char_map, :final

  def initialize
    @char_map = self.gen_map
  end

  def calculate_rotation(rotation_id, key, offset)
    if rotation_id == 'A'
      (key[0..1].to_i + offset[0].to_i) % @char_map.count
    elsif rotation_id == 'B'
      (key[1..2].to_i + offset[1].to_i) % @char_map.count
    elsif rotation_id == 'C'
      (key[2..3].to_i + offset[2].to_i) % @char_map.count
    elsif rotation_id == 'D'
      (key[3..4].to_i + offset[3].to_i) % @char_map.count
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

  def lookup(rotation_id, character, key, offset)
    if rotation_id == 'A'
      create_table('A', key, offset)[character]
    elsif rotation_id == 'B'
      create_table('B', key, offset)[character]
    elsif rotation_id == 'C'
      create_table('C', key, offset)[character]
    elsif rotation_id == 'D'
      create_table('D', key, offset)[character]
    end
  end

  def lookup_key(rotation_id, character, key, offset)
    if rotation_id == 'A'
      table = create_table('A', key, offset)
      table.key(character)
    elsif rotation_id == 'B'
      table = create_table('B', key, offset)
      table.key(character)
    elsif rotation_id == 'C'
      table = create_table('C', key, offset)
      table.key(character)
    elsif rotation_id == 'D'
      table = create_table('D', key, offset)
      table.key(character)
    end
  end

  def chunk(message, chunks)
    message.chars.each_slice(chunks).to_a
  end

  def gen_map
    [*('a'..'z')] + [*('0'..'9')] + [' ', '.', ',']
  end
end
