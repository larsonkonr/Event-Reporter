Dir["./lib/*.rb"].each { |file| require file }
CLI.new($stdout).start
