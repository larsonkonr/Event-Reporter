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
      #input.
      process_initial_commands
    end
  end

  def process_initial_commands
    case
      # @results = input.parse
    # when load?
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
      # find_by_attribute_and_criteria
    _, attribute, criteria = @input.command.split(" ")
      find(attribute, criteria)
    end
  end

  # def load?
  # @results[0] == "load"
  #end

  def find(attribute, criteria)
    queue.clear
    results = repository.find_by(attribute, criteria)
    queue.add(results)
  end

  def quit?
    input.command == "q" || input.command == "quit"
  end
end
