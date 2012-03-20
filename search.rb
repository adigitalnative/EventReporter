require './data_parser'
require './printer'
require 'csv'

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

      "There are #{@queue.size} attendees whose #{parameters[0]} is #{parameters[1..-1].join(" ")}."
    end

    def self.queue
      @queue
    end

    def self.clear_attendees
      @queue = []
    end

    def self.valid_parameters?(parameters)
      true
    end

    def self.save(filename)
      "Saving to #{filename}"

      CSV.open(filename, "w") do |output|

        output << ["last_Name", "first_Name", "Email_Address", "Zipcode", "City", "State", "Street", "HomePhone"]

        @queue.each do |attendee|
          output << make_array(attendee)
        end

        "Saved to #{filename}"

      end
    end

    def self.make_array(attendee)
      [attendee["last_name"], attendee["first_name"], attendee["email"], attendee["zipcode"], attendee["city"], attendee["state"], attendee["address"], attendee["phone"]]
    end

  end
end