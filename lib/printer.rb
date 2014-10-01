class Printer

  def welcome
    puts "EventReporter Initialized!"
  end

  def help
    puts "Available commands:"
    puts "load\nqueue count\nqueue clear\nqueue print\nqueue print by <attribute>\nqueue save to <filename.csv>\nfind <attribute> <criteria>"
  end

  def queue_count(count)
    puts "#{count}"
  end

  def queue_print

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
