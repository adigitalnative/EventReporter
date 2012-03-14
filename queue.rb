module EventReporter
  class Queue
    def call(params)
      log "Starting the Queue#call"
      "Running Queue sub-function #{params[0]}"
      log "Finished the Queue#call"
    end

    def self.valid_parameters?(parameters)
      if !%w(count clear print save).include?(parameters[0])
        false
      elsif parameters[0] == "print"
        parameters.count == 1 || (parameters[1] == "by" && parameters.count == 3 )
      elsif parameters[0] == "save"
        parameters[1] == "to" && parameters.count == 3
      else
        true
      end
    end
  end
end