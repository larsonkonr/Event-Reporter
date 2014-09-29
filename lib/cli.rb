class CLI
  attr_reader :command

  def initialize(stdout)
    @stdout = stdout
    @command = ""
  end

  def start
    puts "EventReporter Initialized!"
    @command = gets.strip
    case
    when command == "load"
      Repository.load_entries("./data")
    end
  end
end
