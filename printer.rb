require './data_parser'
module EventReporter

  class Printer

    def self.print_table(params)
      #Print the array
      attendees = DataParser.get_attendees


      "LAST NAME\tFIRST NAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS\tPHONE"
      
      attendees.each do |attendee|
        puts "#{attendee} BANG!"
      end
    end

  end
end