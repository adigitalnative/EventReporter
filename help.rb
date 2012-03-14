module EventReporter
  class Help

    def self.for(parameters)
      parameters = parameters.join(" ")
      "#{parameters}: #{Command.get_commands[parameters]}."
    end

    def self.valid_parameters?(parameters)
      parameters.empty? || Command.valid?(parameters.join(" "))
    end
  end
end