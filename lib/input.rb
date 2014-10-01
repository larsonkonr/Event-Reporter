class InputParser
  attr_reader :command
  def initialize
    @command = ""
  end

  def get_input
    @command = gets.strip.downcase
  end

  def parse
    command.split(" ")
  end
end
