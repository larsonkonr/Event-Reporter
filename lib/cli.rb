class CLI
  attr_reader :command

  def initialize(stdout)
    @stdout = stdout
    @command = ""
  end

  def start
    puts "EventReporter Initialized!"
  end
end
