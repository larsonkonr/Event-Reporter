class CLI
  attr_reader :command, :queue, :repository, :printer

  def initialize(stdout)
    @stdout = stdout
    @command = ""
    @queue = Queue.new
    @printer = Printer.new
  end

  def start
    printer.welcome
    process_initial_commands
  end

  def process_initial_commands
    until quit?
    @command = gets.strip
      case
      when command == "load"
        @repository = EntryRepository.load_entries("./data")
      when command =~ /(load)/ && command.length > 4
        command, filename = @command.split(" ")
        @repository = EntryRepository.load_entries("./data", filename)
      when command == "help"
        printer.help
      when command == "queue count"
        printer.queue_count(queue.count)
      when command == "queue print"
        queue.print_queue
      when command == "queue clear"
        queue.clear
      when command =~ /(find)/
        find_by_attribute_and_criteria
      end
    end
  end

  def find_by_attribute_and_criteria
    queue.clear
    command, attribute, criteria = @command.split(" ")
    case
    when attribute == "first_name"
      lookup_first_name(criteria)
    when attribute == "last_name"
      lookup_last_name(criteria)
    end
  end

  def lookup_first_name(criteria)
    results = repository.find_by_first_name(criteria)
    results.each do |result|
      queue.add_to_queue(result.name)
    end
  end

  def lookup_last_name(criteria)
    results = repository.find_by_last_name(criteria)
    results.each do |result|
      queue.add_to_queue(result.name)
    end
  end

  def quit?
    command == "q" || command == "quit"
  end
end
