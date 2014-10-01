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
      printf("%-18s", "#{entry.first_name.capitalize}")
      printf("%-18s", "#{entry.last_name.capitalize} ") # longest last_name length: 20
      printf("%-40s", "#{entry.email} ")  # longest email length: 45
      printf("%-15s", "#{entry.phone_number}") # all same length - 10
      printf("%-40s", "#{entry.address}") # longest address length: 73
      printf("%-25s", "#{entry.city}") # longest city length: 26
      printf("%-3s", "#{entry.state}")
      printf("%-6s", "#{entry.zipcode}\n")
    end
  end

  def print_by(attribute)
    queue.sort_by! do |entry|
      entry.send(attribute.to_sym)
    end
    print_queue
  end

  def add(entries)
    @queue += entries
  end
end
