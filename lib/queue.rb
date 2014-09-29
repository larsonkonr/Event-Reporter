class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def count
    queue.count
  end
end
