require 'Date'

class OffsetGen
  attr_accessor :length

  def initialize(length = 4)
    @length = length
  end

  def generate_offset(length = @length)
    date = Date.today.strftime('%d%m%y').to_s.to_i
    offset = (date**2).to_s[-4..-1].to_i
    offset = '0' + offset.to_s if offset.to_s.length != 4
    offset
  end
end
