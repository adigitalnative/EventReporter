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
        attendee_row = [attendee["last_name"],
            attendee["first_name"], attendee["email"],
            attendee["zipcode"], attendee["city"],
            attendee["state"], attendee["address"],
            attendee["phone"]]
        puts attendee_row.join("\t")
      end
      true
    end

  end
end