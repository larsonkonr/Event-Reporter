class EntryQueue
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

  def print_queue
    queue.each do |entry|
      puts entry.name
    end
  end

  def add(entries)
    @queue += entries
  end
end
