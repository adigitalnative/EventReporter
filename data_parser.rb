require 'csv'
require './eventmanager'

module EventReporter
  class DataParser
    def self.load(filename)
      "Loading the data from #{filename[0]}"
      @data = CSV.open(filename[0], :headers => true, :header_converters => :symbol)

      # @data.each do |line|
      #   puts [line[:first_name]]
      # end
    end

    def self.valid_parameters?(parameters)
      parameters.count == 1 && parameters[0] =~ /\.csv$/
    end
  end
end