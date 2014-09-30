class InputParser
  attr_reader :command, :useful_stuff
  def initialize
    @command = ""
    @useful_stuff = ""
  end

  def get_input
    @command = gets.strip.downcase
  end

  def process_load_file_command
    if load_file?
      _, useful_stuff = command.split(" ")
      @useful_stuff = useful_stuff
    end
  end

  def load_file?
    @command =~ /(load)/ && @command.length > 4

  end

  def load?
    @command == "load"
  end

  def queue_clear?
    @command == "queue clear"
  end

  def queue_count?
    @command == "queue count"
  end

  def queue_print?
    @command == "queue print"
  end

  # def find?
  #   @command =~ /(find)/
  # end

  def help?
    @command == "help"
  end


end
