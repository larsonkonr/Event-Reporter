class AttendeeRepository
  attr_reader :attendees

  def initialize(attendees=[])
    @attendees = attendees
  end

  def self.load_attendees(path)
    default_file = "event_attendees.csv"
    if File.directory?(path)
      path = File.join(path, default_file)
    end

    if !File.exist?(path)
      path = File.join("./data", path)
    end

    raise "File not found" unless File.exist?(path)

    contents = CSV.open path, headers: true, header_converters: :symbol
    rows = contents.collect { |row| Attendee.new(row) }
    new(rows)
  end

  def self.save_attendees(filename, queue)
    path = "./data/#{filename}"
    CSV.open(path, 'w') do |csvfile|
      csvfile << Attendee.headers
      queue.each do |attendee|
        csvfile << attendee.to_a
      end
    end
  end

  def find_by(attribute, criteria)
    criteria = criteria.downcase
    attendees.select { |attendee|
      attendee.send(attribute.to_sym).downcase == criteria
    }
  end

end
