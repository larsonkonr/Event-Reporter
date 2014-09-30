class CLI
  attr_reader :command, :queue, :repository, :printer

  def initialize(stdout)
    @stdout = stdout
    @command = ""
    @queue = Queue.new
    @repository = EntryRepository.load_entries("./data")
    @printer = Printer.new
  end

  def start
    printer.welcome
    until quit?
    @command = gets.strip
    case
    when command == "load"
      repository
    when command == "help"
      printer.help
    when command == "queue count"
      printer.queue_count(queue.count)
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
      when attribute == "last_name"
        results = repository.find_by_last_name(criteria)
        results.each do |result|
          puts result.name
        end
      end
    when attribute == ""
    end
    end
  end

  def quit?
    command == "q" || command == "quit"
  end
end
