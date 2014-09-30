class CLI
  attr_reader :input, :queue, :repository, :printer

  def initialize(stdout)
    @stdout = stdout
    @input = InputParser.new
    @queue = EntryQueue.new
    @printer = Printer.new
    @repository = EntryRepository.new([])
  end

  def start
    printer.welcome
    until quit?
      input.get_input
      process_initial_commands
    end
  end

  def process_initial_commands
    case
    when input.load?
      @repository = EntryRepository.load_entries("./data")
    when input.load_file?
      input.process_load_file_command
      @repository = EntryRepository.load_entries(input.useful_stuff)
    when input.help?
      printer.help
    when input.queue_count?
      printer.queue_count(queue.count)
    when input.queue_print?
      queue.print_queue
    when input.queue_clear?
      queue.clear
    when input.command =~ /(find)/
      find_by_attribute_and_criteria
    end
  end

  def find_by_attribute_and_criteria
    queue.clear
    _, attribute, criteria = @input.command.split(" ")


## todo: extract this case statement

    case
    when attribute == "first_name"
      lookup_first_name(criteria)
    when attribute == "last_name"
      lookup_last_name(criteria)
    when attribute == "city"
      lookup_city(criteria)
    when attribute == "state"
      lookup_state(criteria)
    when attribute == "zipcode"
      lookup_zipcode(criteria)
    end
  end

  def find(attribute, criteria)

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

  def lookup_city(criteria)
    results = repository.find_by_city(criteria)
    results.each do |result|
      queue.add_to_queue(result.name)
    end
  end

  def lookup_state(criteria)
    results = repository.find_by_state(criteria)
    results.each do |result|
      queue.add_to_queue(result.name)
    end
  end

  def lookup_zipcode(criteria)
    results = repository.find_by_zipcode(criteria)
    results.each do |result|
      queue.add_to_queue(result.name)
    end
  end

  def quit?
    input.command == "q" || input.command == "quit"
  end
end
