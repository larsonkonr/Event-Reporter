class Help
  attr_reader :printer, :input

  def initialize(input)
    @input = input
    @printer = Printer.new
  end

  def get_help
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

  def just_help?
    input[0] == "help" && input.count == 1
  end

  def help_load?
    input[1] == "load"
  end

  def help_queue_count?
    input[1] == "queue" && input[2] == "count"
  end

  def help_queue_clear?
    input[1] == "queue" && input[2] == "clear"
  end

  def help_queue_print?
    input[1] == "queue" && input[2] == "print"
  end

  def help_queue_print_by?
    input[1..3].join(" ") == "queue print by"
  end

  def help_queue_save?
    input[1] == "queue" && input[2] == "save"
  end

  def help_find?
    input[1] == "find"
  end
end
