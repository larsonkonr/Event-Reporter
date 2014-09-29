class CLI
  attr_reader :command

  def initialize(stdout)
    @stdout = stdout
    @command = ""
  end

  def start
    puts "EventReporter Initialized!"
    puts "Enter your command:"
    @command = gets.strip
    case
    when command == "load"
      Repository.load_entries("./data")
    when command == "help"
      puts "Available commands:"
      puts "load\nqueue count\nqueue clear\nqueue print\nqueue print by <attribute>\nqueue save to <filename.csv>\nfind <attribute> <criteria>"
    end
  end
end
