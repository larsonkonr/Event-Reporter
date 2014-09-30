class CLI
  attr_reader :command, :queue, :repository, :printer

  def initialize(stdout)
    @stdout = stdout
    @command = ""
    @queue = EntryQueue.new
    @printer = Printer.new
  end

  def start
    printer.welcome
    until quit?
      get_input
      process_initial_commands
    end
  end

  def get_input
    @command = gets.strip
  end

  def process_initial_commands
    case
    when command == "load"
      @repository = EntryRepository.load_entries("./data")
    when command =~ /(load)/ && command.length > 4
      _, filename = command.split(" ")
      @repository = EntryRepository.load_entries(filename)
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

  def find_by_attribute_and_criteria
    queue.clear
    _, attribute, criteria = @command.split(" ")
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

  private
  attr_writer :command
end
