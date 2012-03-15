require './data_parser'

module EventReporter
  class Search
    def self.for(parameters)
      "Here's a search for #{parameters.join(" ")}"
      # result = DataParser.get_attendees.inspect.includes?(parameters)

      # if result == true
      #   "I know that information"
      # else
      #   "That information does not exist in my queue"
      # end

    end

    def self.valid_parameters?(parameters)
      # TODO: check that attribute is actually valid
      parameters.count == 2
    end
  end
end