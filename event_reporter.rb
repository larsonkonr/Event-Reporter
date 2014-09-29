Dir["./lib/*.rb"].each { |file| require file }
CLI.new.start






require 'csv'

puts "EventReporter Initialized!"

contents = CSV.open "data/event_attendees.csv", headers: true, header_converters: :symbol
