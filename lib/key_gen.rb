class KeyGen
  attr_accessor :length

  def initialize(length=5)
    @length = length
  end

  def generate_key
    rand(10 ** @length)
  end
end