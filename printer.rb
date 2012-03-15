require './data_parser'
module EventReporter

  class Printer

    def self.print_table(params)
      #Print the array
      
      attendees = DataParser.get_attendees
      
      puts "LAST NAME\tFIRST NAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS\tPHONE"

      attendees.each do |attendee|
        puts "#{attendee["lastname"]}\t#{attendee["firstname"]}\t#{attendee["email"]}\t#{attendee["zipcode"]}\t#{attendee["city"]}\t#{attendee["state"]}\t#{attendee["address"]}\t#{attendee["phone"]}\t"
      end
      true
    end

  end
end