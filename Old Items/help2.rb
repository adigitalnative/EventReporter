class Help

  ALL_COMMANDS = {"load" => "loads a new file", 
                  "help" => "Help is available for ",
                  "queue" => "a set of data",
                  "queue count" => "total items in the queue", 
                  "queue clear" => "empties the queue",
                  "queue print" => "prints to the queue", 
                  "queue print by" => "prints the specified attribute",
                  "queue save to" => "exports queue to a CSV", 
                  "find" => "load the queue with matching records"}

  # def self.valid_command?(command)
  #   ALL_COMMANDS.keys.include?(command)
  # end

  def self.valid_parameters?(parameters)
    parameters.empty? || Command.valid?(parameters.join(" "))
  end

  def self.for(parameters)

    # TODO: Take the value associated with the parameter and print it.

    puts "Here's help for #{parameters.join(" ")}"
    puts ALL_COMMANDS.values_at(parameters.to_s)
  end

end