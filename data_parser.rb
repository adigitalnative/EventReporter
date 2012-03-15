require 'csv'
require './cleaner'

module EventReporter
  class DataParser

    # attr_accessor {:first_name, :last_name, :homephone, :reg_date, :zipcode,}


    def self.load(filename)
      @data = CSV.open(filename[0], :headers => true, :header_converters => :symbol)
      get_attendees
    end

    def self.get_attendees
      if @attendees == nil
        @attendees = []

        @data.each do |line|
          # TODO: Clean data.
          attendee = [line[:last_name],
                      line[:first_name],
                      line[:email_address],
                      Cleaner.clean_zipcode(line[:zipcode]),
                      Cleaner.clean_phone_number(line[:homephone]),
                      line[:city],
                      line[:state],
                      line[:street]]
          @attendees << attendee
        end
        @attendees
      else
        @attendees
      end
    end

    def self.clear_attendees
      @attendees = nil
    end

    # def self.output_data(params)
    #   output = File.new(params[2], "w")
    #     @attendees.each do |line|
    #       output << [line[0], line[1], line[2]]
    #     end
    #   output.close
    # end

    def self.find(param)
      "Searching for #{param}"
    end

    def self.valid_parameters?(parameters)
      parameters.count == 1 && parameters[0] =~ /\.csv$/
    end
  end
end