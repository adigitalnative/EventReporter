require './data_parser'
module EventReporter

  class Printer

    def self.print_table(params)
      #Print the array
      attendees = DataParser.get_attendees.inspect

      # attendees.each do |attendee|
      #   "#{attendee[0]}"
      # end
    end

  end
end