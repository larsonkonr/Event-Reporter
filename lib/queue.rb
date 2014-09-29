class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def count
    queue.count
  end

  def clear
    @queue = []
  end

  def add_to_queue(entry)
    @queue << entry
  end

  def print_queue
    puts queue
  end
end
