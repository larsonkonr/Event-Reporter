require 'csv'

puts "EventReporter Initialized!"

contents = CSV.open "data/event_attendees.csv", headers: true, header_converters: :symbol
