gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/queue'

class QueueTest < Minitest::Test
  attr_reader :queue

  def setup
    @queue = Queue.new
  end

  def test_queue_starts_out_empty
    assert_equal 0, queue.count
  end
end
