require_relative 'test_helper'

class AttendeeTest < Minitest::Test
  attr_reader :attendee

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
    @attendee = Attendee.new(data)
  end

  def test_regdate
    assert_equal "09/28/2014 03:05", attendee.regdate
  end

  def test_first_name
    assert_equal "alice", attendee.first_name
  end

  def test_last_name
    assert_equal "steve", attendee.last_name
  end

  def test_email
    assert_equal "kate@jumpstartlabs.com", attendee.email
  end

  def test_phone_number
    assert_equal "1111111111", attendee.phone_number
  end

  def test_address
    assert_equal "123 some st", attendee.address
  end

  def test_city
    assert_equal "denver", attendee.city
  end

  def test_state
    assert_equal "co", attendee.state
  end

  def test_zipcode
    assert_equal "80203", attendee.zipcode
  end
end
