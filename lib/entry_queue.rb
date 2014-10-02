class EntryQueue
  attr_reader :queue, :counter, :input, :printer

  def initialize
    @queue = []
  end

  def process_command(input, printer)
    @input = input
    @printer = printer
    case
    when count? then printer.queue_count(queue.count)
    when print? then print_queue
    when print_by? then print_by(input[3])
    when clear? then clear
    when save? then save_file
    end
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
      printf("%-18s", "LAST NAME")
      printf("%-40s", "EMAIL")
      printf("%-15s", "PHONE NUMBER")
      printf("%-40s", "ADDRESS")
      printf("%-25s", "CITY")
      printf("%-8s", "STATE")
      printf("%-5s", "ZIPCODE\n")
    queue.each do |entry|
      printf("%-18s", "#{entry.first_name.capitalize}")
      printf("%-18s", "#{entry.last_name.capitalize} ")
      printf("%-40s", "#{entry.email} ")
      printf("%-15s", "#{entry.phone_number}")
      printf("%-40s", "#{entry.address.split.map(&:capitalize)*' '}")
      printf("%-25s", "#{entry.city.split.map(&:capitalize)*' '}")
      printf("%-8s", "#{entry.state.upcase}")
      printf("%-5s", "#{entry.zipcode}\n")
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

  def save_file
    EntryRepository.save_entries(input[3], queue)
  end

  def count?
    input[1] == "count"
  end

  def print?
    input[1] == "print" && input.count == 2
  end

  def print_by?
    input[2] == "by"
  end

  def clear?
    input[1] == "clear"
  end

  def save?
    input[1] == "save"
  end
end
