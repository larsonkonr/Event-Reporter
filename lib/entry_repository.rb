require 'csv'

class EntryRepository

  attr_reader :entries

  def self.load_entries(directory, filename = 'event_attendees.csv')
    file = File.join(directory, filename)
    contents = CSV.open file, headers: true, header_converters: :symbol
    puts "Loaded #{file}"
    rows = contents.collect { |row| Entry.new(row) }
  end

  def initialize(entries)
    @entries = entries
  end

  def find_by_first_name(name)
    entries.select { |entry| entry.first_name == name }
  end

  def find_by_last_name(name)
    entries.select { |entry| entry.last_name == name }
  end

  def find_by_first_and_last_name(first, last)
    entries.select { |entry| entry.first_name == first}.select { |entry| entry.last_name == last }
  end

  def find_by_number(number)
    entries.select {|entry| entry.phone_number == number}
  end

  def find_by_zipcode(zipcode)
    entries.select { |entry| entry.zipcode == zipcode }
  end

  def find_by_city(city)
    entries.select { |entry| entry.city == city}
  end

  def find_by_state(state)
    entries.select { |entry| entry.state == state }
  end

  def find_by_email(email)
    entries.select { |entry| entry.email == email }
  end

  def find_by_address(address)
    entries.select { |entry| entry.address == address }
  end

end
