require 'Date'

class OffsetGen
  def initialize(length)
    @length = length
  end

  def generate_offset(length=@length)
    date = Date.today.strftime('%d%m%y').to_s.to_i
    offset = (date ** 2).to_s[-4..-1].to_i
    if offset.length != 4
      offset = (date.to_i * date.to_i).to_s[-4..-1]
    end
    offset
  end
end