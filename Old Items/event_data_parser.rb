require 'csv'

class EventDataParser
  def self.load(filename)

    # TODO: Default to event_attendees.csv

    @file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    puts "Loaded data from #{filename}"

    # Clean phone numbers
    # Clean Zipcodes

  end

  def self.valid_parameters?(parameters)
    parameters.count == 1 && parameters[0] =~ /\.csv$/
  end

end