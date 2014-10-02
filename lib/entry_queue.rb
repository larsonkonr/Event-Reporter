class EntryQueue
  attr_reader :queue, :counter

  def initialize
    @queue = []
    @counter = 0
  end

  def count
    queue.count
  end

  def clear
    @queue = []
  end

  def print_queue
      puts "#{count} attendees loaded"
      printf("%-18s", "FIRST NAME")
      printf("%-18s", "LAST NAME") # longest last_name length: 20
      printf("%-40s", "EMAIL")  # longest email length: 45
      printf("%-15s", "PHONE NUMBER") # all same length - 10
      printf("%-40s", "ADDRESS") # longest address length: 73
      printf("%-25s", "CITY") # longest city length: 26
      printf("%-8s", "STATE")
      printf("%-5s", "ZIPCODE\n")
    if counter < count 
    queue.each do |entry|
      printf("%-18s", "#{entry.first_name.capitalize}")
      printf("%-18s", "#{entry.last_name.capitalize} ") # longest last_name length: 20
      printf("%-40s", "#{entry.email} ")  # longest email length: 45
      printf("%-15s", "#{entry.phone_number}") # all same length - 10
      printf("%-40s", "#{entry.address.split.map(&:capitalize)*' '}") # longest address length: 73
      printf("%-25s", "#{entry.city.split.map(&:capitalize)*' '}") # longest city length: 26
      printf("%-8s", "#{entry.state.upcase}")
      printf("%-5s", "#{entry.zipcode}\n")
      @counter + 1
    end
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
