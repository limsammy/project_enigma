require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/encrypt'

class DecryptTest < Minitest::Test

  def test_decrypt_accessor_for_pry
    d = Decrypt.new
    d.decrypt("v1db,2n,cro0ua58g,,wiy","41652","0489")
  end
end
