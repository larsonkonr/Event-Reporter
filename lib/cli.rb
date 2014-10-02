require "csv"
class CLI
  attr_reader :input, :queue, :repository, :printer, :results

  def initialize(stdout)
    @stdout = stdout
    @input = InputParser.new
    @queue = EntryQueue.new
    @repository = EntryRepository.new([])
    @printer = Printer.new
  end

  def start
    printer.welcome
    until quit?
      printer.prompt
      input.get_input
      process_commands
      printer.goodbye if quit?
    end
  end

  def process_commands
    @results = input.parse
    case
    when load? then load_file
    when help? then process_help_command
    when queue_command? then process_queue_command
    when find? then find(attribute, criteria)
    end
  end

  def load_file
    load_default_file? ? load_default_file : load_other_file
  end

  def load_default_file?
    load? && one_word?
  end

  def load?
    results[0] == "load"
  end

  def load_default_file
    @repository = EntryRepository.load_entries("./data")
  end

  def load_other_file
    @repository = EntryRepository.load_entries(results[1])
  end

  def help?
    results[0] == "help"
  end

  def just_help?
    results[0] == "help" && one_word?
  end

  def process_help_command
    case
    when just_help? then printer.help
    when help_load? then printer.help_load
    when help_queue_count? then printer.help_queue_count
    when help_queue_clear? then printer.help_queue_clear
    when help_queue_print? then printer.help_queue_print
    when help_queue_print_by? then printer.help_queue_print_by
    when help_queue_save? then printer.help_queue_save
    when help_find? then printer.help_find
    end
  end

  def help_load?
    help? && results[1] == "load"
  end

  def help_queue_count?
    help? && results[1] == "queue" && results[2] == "count"
  end

  def help_queue_clear?
    help? && results[1] == "queue" && results[2] == "clear"
  end

  def help_queue_print?
    help? && results[1] == "queue" && results[2] == "print"
  end

  def help_queue_print_by?
    help? && results[1..3].join(" ") == "queue print by"
  end

  def help_queue_save?
    help? && results[1] == "queue" && results[2] == "save"
  end

  def help_find?
    help? && results[1] == "find"
  end

  def find?
    results[0] == "find"
  end

  def attribute
    results[1]
  end

  def criteria
    results[2..-1].join(" ")
  end

  def one_word?
    results.count == 1
  end

  def queue_command?
    results[0] == "queue"
  end

  def process_queue_command
    case
    when queue_count? then printer.queue_count(queue.count)
    when queue_print? then queue.print_queue
    when queue_print_by? then queue.print_by(results[3])
    when queue_clear? then queue.clear
    when queue_save? then queue_save_file
    end
  end

  def queue_save?
    results[1] == "save"
  end

  def queue_count?
    queue_command? && results[1] == "count"
  end

  def queue_print?
    queue_command? && results[1] == "print" && results.count == 2
  end

  def queue_print_by?
    queue_command? && results[2] == "by"
  end

  def queue_clear?
    queue_command? && results[1] == "clear"
  end

  def queue_save_file
    EntryRepository.save_entries(results[3], queue)
  end

  def find(attribute, criteria)
    queue.clear
    search_results = repository.find_by(attribute, criteria)

    queue.add(search_results)
  end

  def quit?
    input.command == "q" || input.command == "quit"
  end
end
