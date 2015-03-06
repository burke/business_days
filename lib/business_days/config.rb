module BusinessDays
  class Config
    def self.holidays= dates
      @holidays = Set.new(Array(dates))
    end

    def self.holidays
      @holidays || []
    end
  end
end
