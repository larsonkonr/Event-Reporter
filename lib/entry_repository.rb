require 'csv'

class EntryRepository

  attr_reader :entries

  def self.load_entries(path)
    default_file = "event_attendees.csv"
    if File.directory?(path)
      path = File.join(path, default_file)
    end

    if !File.exist?(path)
      path = File.join("./data", path)
    end

    raise "File not found" unless File.exist?(path)

    contents = CSV.open path, headers: true, header_converters: :symbol
    rows = contents.collect { |row| Entry.new(row) }
    new(rows)
  end

  # def self.save_entries(filename)
  #   path = "./data/#{filename}"
  #   File.open(path, 'wb') do |row|
  #     row.puts "some stuff"
  #     # queue.each do |row|
  #     #   filename << row
  #     # end
  #   end
  # end

  def initialize(entries)
    @entries = entries
  end

  def ==(rhs)
    entries == rhs.entries
  end

  def find_by(attribute, criteria)
    entries.select {|entry| entry.send(attribute.to_sym) == criteria}
  end

end
