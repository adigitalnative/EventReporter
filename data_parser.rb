require 'csv'

module EventReporter
  class DataParser
    def self.load(filename)
      "Loading the data from #{filename[0]}"
      @attendees = CSV.open(filename[0], :headers => true, :header_converters => :symbol)
      get_attendees
    end

    def self.get_attendees
      @attendees
    end

    def self.valid_parameters?(parameters)
      parameters.count == 1 && parameters[0] =~ /\.csv$/
    end
  end
end