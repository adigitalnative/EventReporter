require 'csv'
require './cleaner'

module EventReporter
  class DataParser

    # attr_accessor {:first_name, :last_name, :homephone, :reg_date, :zipcode,}

    def self.csv_options
      {:headers => true, :header_converters => :symbol}
    end

    def self.load(filename)
      @data = []
      @data = CSV.open(filename[0], csv_options)
      get_attendees
      "Loaded #{@attendees.count} attendees."
    end

    def self.load_default(filename)
      filename = "event_attendees.csv"
      @data = []
      @data = CSV.open(filename, csv_options)
      get_attendees
      "Loaded #{@attendees.count} attendees."
    end

    def self.get_attendees
      if @attendees == nil
        @attendees = []

        if @data != nil
          @data.each do |line|
            attendee = {"last_name" => Cleaner.clean_line(line[:last_name]),
              "first_name" => Cleaner.clean_line(line[:first_name]),
              "email" => Cleaner.clean_line(line[:email_address]),
              "zip" => Cleaner.clean_zipcode(line[:zipcode]),
              "city" => line[:city], "state" => line[:state],
              "address" => line[:street],
              "phone" => Cleaner.clean_phone_number(line[:homephone])}
            @attendees << attendee
          end
        end
      end
      @attendees
    end

    def self.clear_attendees
      @attendees = nil
    end

    def self.find(param)
      "Searching for #{param}"
    end

    def self.valid_parameters?(parameters)
      parameters.count == 1 && parameters[0] =~ /\.csv$/
    end
  end
end