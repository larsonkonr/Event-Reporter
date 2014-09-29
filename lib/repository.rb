require 'csv'
require_relative 'entry'

class Repository

  attr_reader :entries

  def self.load_entries(directory)
    file = File.join(directory, 'event_attendees.csv')
    data = CSV.open(file, headers: true, header_converters: :symbol)
    rows = data.map do |row|
      Entry.new(row)
    end
    new(rows)
  end

  def initialize(entries)
    @entries = entries
  end

  def find_by_first_name(name)
    entries.select { |entry| entry.first_Name == name }
  end

  def find_by_last_name(name)
    entries.select { |entry| entry.last_Name == name }
  end

  def find_by_first_and_last_name(first, last)
    entries.select { |entry| entry.first_name == first}.select { |entry| entry.last_name == last }
  end

  def find_by_number(number)
    entries.select {|entry| entry.phone_number == number}
  end

  zip
  city
  state
  email
  address

end
