require './command'
require 'logger'

# module Kernel
#   def log(message)
#     if $logger.nil?
#       warn "Opening a log file"
#       $logger = Logger.new("dev.log")
#     end
    
#     $logger.info(message)
#   end
# end


module EventReporter
  class CLI
    EXIT_COMMANDS = ["quit", "q", "e", "exit"]

    def self.parse_user_input(input)
      [ input.first.downcase, input[1..-1] ]
    end

    def self.prompt_user
      printf "enter command > "
      gets.strip.split
    end

    def self.run
      puts "Welcome to the EventReporter"
      results = ""

      while results
        # log "Executing a command from CLI.run"
        results = execute_command(prompt_user)
        puts results if results
        # log "Finished a command from CLI.run"
      end

      puts "Goodbye!"
    end

    def self.execute_command(inputs)
      if inputs.any?
        command, parameters = parse_user_input(inputs)
        Command.execute(command, parameters) unless quitting?(command)
      else
        "No command entered."
      end
    end

    def self.quitting?(command)
      EXIT_COMMANDS.include?(command)
    end
  end
end

EventReporter::CLI.run