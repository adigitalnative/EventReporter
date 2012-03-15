require './data_parser'
module EventReporter

  class Printer

    def self.print_table(params)
      #Print the array
      @attendees = DataParser.get_attendees

      "LAST NAME\tFIRST NAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS"

      # @attendees.each do |attendee|
      #   "Foo"
      # end

      # attendees.each do |attendee|
      #   "#{attendee.lastname}"
      # end

      # attendees.each do |key, information|
      #   "#{attendees[lastname]}"
      # end

      # attendees.each do |attendee|
      #   "#{attendee[0]}"
      # end
    end

  end
end