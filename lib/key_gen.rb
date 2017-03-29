require 'pry'
class KeyGen
  attr_accessor :length

  def initialize(length = 5)
    @length = length
  end

  def generate_key(length = @length)
    key = rand(10**@length)
    key = '0' + key.to_s if key.to_s.length < 5
    key.to_s
  end
end
