module EventReporter
  class Cleaner

    INVALID_ZIPCODE = "00000"

    def self.clean_phone_number(phone_number)
      phone_number = phone_number.scan(/\d/).join

      if phone_number.length == 10
        phone_number
      elsif phone_number.length == 11 && phone_number.start_with?("1")
        phone_number[1..-1]
      else
        "0"*10
      end
    end

    def self.clean_zipcode(original)
      if original.nil?
        result = INVALID_ZIPCODE
      elsif original.length <5
        short = 5-original.length
        zip_addition = "0" * short
        result = zip_addition + original
      else
        result = original
      end
    end

    def self.clean_line(line)
      if line != nil
        line.downcase
      end
    end

  end
end