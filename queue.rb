require './data_parser'
require './printer'

module EventReporter
  class Queue

    @queue = []

    def call(params)
      if params[0] == "count"
        "There are #{Search.queue.count} attendees in the queue."
      elsif params[0] == "clear"
        Search.clear_attendees
        "List of attendees cleared."
      elsif params[0] == "print"
        if params[1] == nil
          Printer.print_table(params)
        else
          Printer.sort_table(params[2])
        end
      elsif params[0] == "save"
        Search.save(params[2])
      else
        "I don't know #{params[0]} yet."
      end

    end

    def self.valid_parameters?(parameters)
      if !%w(count clear print save).include?(parameters[0])
        false
      elsif parameters[0] == "print"
        parameters.count == 1 ||
          (parameters[1] == "by" && parameters.count == 3)
      elsif parameters[0] == "save"
        parameters[1] == "to" && parameters.count == 3
      else
        true
      end
    end


  end
end