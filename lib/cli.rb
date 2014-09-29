class CLI
  attr_reader :command, :queue, :repository

  def initialize(stdout)
    @stdout = stdout
    @command = ""
    @queue = Queue.new
    @repository = EntryRepository.load_entries("./data")
  end

  def start
    puts "EventReporter Initialized!"
    puts "Enter your command:"
    until quit?
    @command = gets.strip
    case
    when command == "load"
      repository
    when command == "help"
      puts "Available commands:"
      puts "load\nqueue count\nqueue clear\nqueue print\nqueue print by <attribute>\nqueue save to <filename.csv>\nfind <attribute> <criteria>"
    when command == "queue count"
      puts queue.count
    when command == "queue print"
      queue.print_queue
    when command == "queue clear"
      queue.clear
    when command =~ /(find)/
      queue.clear
      command, attribute, criteria = @command.split(" ")
      case
      when attribute == "first_name"
        results = repository.find_by_first_name(criteria)
        results.each do |result|
          queue.add_to_queue(result.name)
        end
        puts results.count
      when attribute == "last_name"
        results = repository.find_by_last_name(criteria)
        results.each do |result|
          puts result.name
        end
        puts results.count
      end
    when attribute == ""
    end
    end
  end

  def quit?
    command == "q" || command == "quit"
  end
end
