require 'pry'
class KeyGen
  attr_accessor :length

  def initialize(length=5)
    @length = length
  end

  def generate_key(length=@length)
    key = rand(10 ** @length)
    if key.to_s.length < 5
      key = '0' + key.to_s
    end
    key.to_s
  end
  
end
