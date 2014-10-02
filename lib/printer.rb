require "colorize"
class Printer

  def welcome
    puts "EventReporter Initialized!".yellow
  end

  def help
    puts "Available commands:".green
    puts "load\nqueue count\nqueue clear\nqueue print\nqueue print by <attribute>\nqueue save to <filename.csv>\nfind <attribute> <criteria>".green
  end

  def help_load
    puts "load:".green
    puts 'Will load the default file if not specified ie: "load file.csv"'.green
  end

  def help_queue_count
    puts "queue count:".green
    puts "Will count the queue from the last search you performed".green
  end

  def help_queue_clear
    puts "queue clear:".green
    puts "Will clear all attendees from the queue. So will searching for another criteria".green
  end

  def help_queue_print
    puts "queue print:".green
    puts "Will display the last search you performed".green
  end

  def help_queue_print_by
    puts "queue print by <attribute>:".green
    puts 'Will display the last search you performed by the attribute you attach ie:"queue print by state"'.green
  end

  def help_queue_save
    puts "queue save to:".green
    puts 'Will save the data from your last search to the file of your choosing ie:"queue save to file.csv"'.green
  end

  def help_find
    puts "find <attribute> <criteria>:".green
    puts 'Will allow you to enter the attribute "last_name" and criteria "johnston" to find and put in to you queue for viewing'.green
  end

  def queue_count(count)
    puts "#{count}"
  end

  def goodbye
    puts "Goodbye.".blue
  end

  def prompt
    puts "Enter your command:"
  end
end
