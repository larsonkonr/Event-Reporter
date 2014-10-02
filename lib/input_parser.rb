class InputParser
  attr_accessor :command

  def initialize
    @command = ""
  end

  def get_input
    @command = get_command.strip.downcase
  end

  def get_command
    gets
  end

  def parse
    command.split(" ")
  end
end
