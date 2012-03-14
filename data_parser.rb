module EventReporter
  class DataParser
    def self.load(filename)
      "Loading the data from #{filename}!"
    end

    def self.valid_parameters?(parameters)
      parameters.count == 1 && parameters[0] =~ /\.csv$/
    end
  end
end