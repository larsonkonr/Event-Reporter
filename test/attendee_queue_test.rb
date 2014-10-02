require_relative 'test_helper'

class AttendeeQueueTest < Minitest::Test
  attr_reader :queue, :attendees

  def setup
    @attendees = [ { regdate: "09/28/2014 03:05",
                   first_name: "Steve",
                   last_name: "Alice",
                   email_address: "steve@jumpstartlabs.com",
                   homephone: "222.222.2222",
                   street: "123 Some St",
                   city: "Denver",
                   state: "CO",
                   zipcode: "80203" },
                 { regdate: "09/28/2014 03:05",
                   first_name: "Alice",
                   last_name: "Steve",
                   email_address: "alice@jumpstartlabs.com",
                   homephone: "111.111.1111",
                   street: "456 Some St",
                   city: "Denver",
                   state: "CO",
                   zipcode: "80203" } ]
    @queue = AttendeeQueue.new
  end

  def test_queue_starts_out_empty
    assert_equal 0, queue.count
  end

  def test_can_add_to_queue
    queue.add(attendees)
    assert_equal 2, queue.count
  end

  def test_can_clear_queue
    queue.add(attendees)
    queue.clear
    assert_equal 0, queue.count
  end
end
