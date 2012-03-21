require './data_parser'
require './help'
require './queue'
require './search'
require 'ap'

module EventReporter
  class Command
    ALL_COMMANDS = {"load" => "loads a new file",
                    "help" => "Load the helpfile",
                    "queue" => "a set of data",
                    "queue count" => "total items in the queue",
                    "queue clear" => "empties the queue",
                    "queue print" => "prints to the queue",
                    "queue print by" => "prints the specified attribute",
                    "queue save to" => "exports queue to a CSV",
                    "find" => "load the queue with matching records"}

    def self.get_commands
      ALL_COMMANDS
    end

    def self.valid?(command)
      get_commands.keys.include?(command)
    end

    def self.execute(command, parameters)

      if command == "load" && DataParser.valid_parameters?(parameters)
        DataParser.load(parameters)
      elsif command == "load"
        DataParser.load_default(parameters)
      elsif command == "queue" && Queue.valid_parameters?(parameters)
        Queue.new.call(parameters)
      elsif command == "help" && parameters == []
        "Options are: #{ALL_COMMANDS.keys.join(", ")}."
      elsif command == "help" && Help.valid_parameters?(parameters)
        Help.for(parameters)
      elsif command == "find" && Search.valid_parameters?(parameters)
        Search.for(parameters).downcase
      else
        error_message_for(command)
      end
    end

    def self.error_message_for(command)
      "Sorry, you specified invalid arguments for #{command}."
    end
  end
end