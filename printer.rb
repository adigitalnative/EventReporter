require './data_parser'
module EventReporter

  class Printer

    def self.print_table(params)
      attendees = Search.queue
      print(attendees)
    end

    def self.sort_table(params)
      attendees = Search.queue
      attendees = attendees.sort_by {|att| att["#{params}"]}
      puts "Printing sorted by #{params}."
      print(attendees)
    end

    def self.print(attendees)

      puts "LAST NAME\tFIRST NAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS\tPHONE"

      attendees.each do |attendee|
        puts "#{attendee["last_name"]}\t#{attendee["first_name"]}\t#{attendee["email"]}\t#{attendee["zipcode"]}\t#{attendee["city"]}\t#{attendee["state"]}\t#{attendee["address"]}\t#{attendee["phone"]}\t"
      end 
      true
    end

  end
end