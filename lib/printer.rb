require "colorize"
class Printer

  def welcome
    puts "EventReporter Initialized!".blue
  end

  def help
    puts "Available commands:"
    puts "load\nqueue count\nqueue clear\nqueue print\nqueue print by <attribute>\nqueue save to <filename.csv>\nfind <attribute> <criteria>"
  end

  def help_load
    puts "load:"
    puts 'Will load the default file if not specified ie: "load file.csv"'
  end

  def help_queue_count
    puts "queue count:"
    puts "Will count the queue from the last search you performed"
  end

  def help_queue_clear
    puts "queue clear:"
    puts "Will clear all attendees from the queue. So will searching for another criteria"
  end

  def help_queue_print
    puts "queue print:"
    puts "Will display the last search you performed"
  end

  def help_queue_print_by
    puts "queue print by <attribute>:"
    puts 'Will display the last search you performed by the attribute you attach ie:"queue print by state"'
  end

  def help_queue_save
    puts "queue save to:"
    puts 'Will save the data from your last search to the file of your choosing ie:"queue save to file.csv"'
  end

  def help_find
    puts "find <attribute> <criteria>:"
    puts 'Will allow you to enter the attribute "last_name" and criteria "johnston" to find and put in to you queue for viewing'
  end

  def queue_count(count)
    puts "#{count}"
  end

  def goodbye
    puts "Goodbye."
  end

  def prompt
    puts "Enter your command:"
  end

  def quit
    puts "Goodbye"
  end
end
