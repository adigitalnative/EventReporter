require './data_parser'
require './printer'

module EventReporter
  class Search
    def self.for(parameters)

      @attendees = DataParser.get_attendees
      @queue = []

      @attendees.each do |attendee|
        if attendee[parameters[0]].include?(parameters[1])
          @queue << attendee
        end

      end

      load_into_queue(@queue)
      "There are #{@queue.size} attendees whose #{parameters[0]} is #{parameters[1]}."

      # "I have loaded all attendees whose #{parameters[0]} is #{parameters[1]}."
    end

    def self.valid_parameters?(parameters)
      # TODO: check that attribute is actually valid
      parameters.count == 2
    end
  end
end