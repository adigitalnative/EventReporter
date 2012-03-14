require 'csv'

module EventReporter
  class DataParser

    # attr_accessor {:first_name, :last_name, :homephone, :reg_date, :zipcode,}


    def self.load(filename)
      "Loading the data from #{filename[0]}"
      @data = CSV.open(filename[0], :headers => true, :header_converters => :symbol)
      get_attendees
    end

    def self.get_attendees
      if @attendees == nil
        @attendees = []

        @data.each do |line|
          # TODO: Pull the full range of data.
          # TODO: Clean data.
          attendee = [line[:first_name], line[:last_name], line[:homephone]]
          @attendees << attendee
        end
        @attendees.inspect
      else
        @attendees
      end
    end

    def self.valid_parameters?(parameters)
      parameters.count == 1 && parameters[0] =~ /\.csv$/
    end
  end
end