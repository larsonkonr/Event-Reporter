gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/queue'

class QueueTest < Minitest::Test
  attr_reader :queue, :data

  def setup
    @data = { regdate: "09/28/2014 03:05",
             first_name: "Alice",
             last_name: "Steve",
             email_address: "kate@jumpstartlabs.com",
             homephone: "111.111.1111",
             street: "123 Some St",
             city: "Denver",
             state: "CO",
             zipcode: "80203" }
    @queue = Queue.new
  end

  def test_queue_starts_out_empty
    assert_equal 0, queue.count
  end

  def test_can_add_to_queue
    queue.add_to_queue(data)
    assert_equal 1, queue.count
  end

  def test_can_clear_queue
    queue.add_to_queue(data)
    queue.clear
    assert_equal 0, queue.count
  end

  # def test_can_print_queue
  #   queue.add_to_queue(data)
  #   assert_equal data, queue.print_queue
  # end
end
