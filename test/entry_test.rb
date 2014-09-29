gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/entry'

class EntryTest < Minitest::Test
  attr_reader :entry

  def setup
    data = { regdate: "09/28/2014 03:05",
             first_name: "Alice",
             last_name: "Steve",
             email_address: "kate@jumpstartlabs.com",
             homephone: "111.111.1111",
             street: "123 Some St",
             city: "Denver",
             state: "CO",
             zipcode: "80203" }

    @entry = Entry.new(data)
  end

  def test_name
    assert_equal "Alice Steve", entry.name
  end

  def test_regdate
    assert_equal "09/28/2014 03:05", entry.regdate
  end

  def test_first_name
    assert_equal "Alice", entry.first_name
  end

  def test_last_name
    assert_equal "Steve", entry.last_name
  end

  def test_email
    assert_equal "kate@jumpstartlabs.com", entry.email
  end

  def test_phone_number
    assert_equal "111.111.1111", entry.phone_number
  end

  def test_address
    assert_equal "123 Some St", entry.address
  end

  def test_city
    assert_equal "Denver", entry.city
  end

  def test_state
    assert_equal "CO", entry.state
  end

  def test_zipcode
    assert_equal "80203", entry.zipcode
  end
end
