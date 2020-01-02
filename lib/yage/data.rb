module Yage
  Data = Struct.new(:base, :dist, :year, :month, :mday, :yday) do
    def to_s
      "#{year} year#{year > 1 ? "s" : ""}"
    end

    # format by following variable
    #   - %year
    #   - %month
    #   - %mday
    #   - %yday
    # ex) format("v%year.%month.%mday")
    def format(str, *args)
      str.gsub!(/%year/, year.to_s)
      str.gsub!(/%month/, month.to_s)
      str.gsub!(/%mday/, mday.to_s)
      str.gsub!(/%yday/, yday.to_s)
      sprintf str, *args
    end

    def semver
      format("v%year.%month.%mday")
    end

    def age_yday
      format("v%year.%yday")
    end
  end
end
