require './data_parser'

module EventReporter
  class Queue
    def call(params)
      if params[0] == "count"
        "#{DataParser.get_attendees.count}"
      elsif params[0] == "clear"
        DataParser.clear_attendees
        "List of attendees cleared."
      # elsif params[0] == "print"
      #   # DataParser.output_data(params)
      #   "Let me put that in a file for you."
      else
        "I don't know #{params[0]} yet."
      end
    end

    def self.valid_parameters?(parameters)
      if !%w(count clear print save).include?(parameters[0])
        false
      elsif parameters[0] == "print"
        parameters.count == 1 || (parameters[1] == "by" && parameters.count == 3 )
      elsif parameters[0] == "save"
        parameters[1] == "to" && parameters.count == 3
      else
        true
      end
    end
  end
end