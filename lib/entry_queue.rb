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
      print "#{entry.first_name} "
      print "#{entry.last_name} "
      print "#{entry.email} "
      print "#{entry.phone_number} "
      print "#{entry.address} "
      print "#{entry.city} "
      print "#{entry.state} "
      print "#{entry.zipcode} \n"
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
