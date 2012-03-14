module EventReporter
  class Help

    # TODO: This is repeated. Fix it.
    ALL_COMMANDS = {"load" => "loads a new file",
                    "help" => "shows a list of available commands",
                    "queue" => "a set of data",
                    "queue count" => "total items in the queue",
                    "queue clear" => "empties the queue",
                    "queue print" => "prints to the queue",
                    "queue print by" => "prints the specified attribute",
                    "queue save to" => "exports queue to a CSV",
                    "find" => "load the queue with matching records"}

    def self.for(parameters)
      parameters = parameters.join(" ")
      "Here's help for #{parameters}"
      "#{parameters}: #{ALL_COMMANDS[parameters]}."
    end

    def self.valid_parameters?(parameters)
      parameters.empty? || Command.valid?(parameters.join(" "))
    end
  end
end