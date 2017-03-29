require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/encrypt'
require 'minitest/filesystem'

class DecryptTest < Minitest::Test
  def test_decrypt_exists
    d = Decrypt.new
    assert Decrypt, d.class
  end

  def test_decrypt_returns_string
    d = Decrypt.new
    assert_instance_of String, d.decrypt('v1db,2n,cro0ua58g,,wiy', '41652', '0489')
  end

  def test_decrypt_accessor_for_pry
    d = Decrypt.new
    d.decrypt('v1db,2n,cro0ua58g,,wiy', '41652', '0489')
  end

  def test_file_decrypt_creates_file
    d = Decrypt.new
    d.file_decrypt('to_decrypt.txt', 'decrypted.txt', '41652', '0489')

    assert_exists './decrypted.txt'
  end
end
