class CLI
  attr_reader :command, :queue

  def initialize(stdout)
    @stdout = stdout
    @command = ""
    @queue = Queue.new
  end

  def start
    puts "EventReporter Initialized!"
    puts "Enter your command:"
    @command = gets.strip
    case
    when command == "load"
      EntryRepository.load_entries("./data")
    when command == "help"
      puts "Available commands:"
      puts "load\nqueue count\nqueue clear\nqueue print\nqueue print by <attribute>\nqueue save to <filename.csv>\nfind <attribute> <criteria>"
    when command == "queue count"
      puts queue.count
    end
  end
end
