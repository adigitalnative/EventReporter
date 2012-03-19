require './data_parser'
require './printer'

module EventReporter
  class Search
    @queue = []

    def self.for(parameters)
      @queue = []

      @attendees = DataParser.get_attendees

      @attendees.each do |attendee|
        if attendee[parameters[0]] == (parameters[1..-1].join(" "))
          @queue << attendee
        end
      end

      "There are #{@queue.size} attendees whose #{parameters[0]} is #{parameters[1]}."
      # "I have loaded all attendees whose #{parameters[0]} is #{parameters[1]}."
    end

    def self.queue
      @queue
    end

    def self.clear_attendees
      @queue = []
    end

    def self.valid_parameters?(parameters)
      # TODO: check that attribute is actually valid
      parameters.count == 2
    end

  end
end