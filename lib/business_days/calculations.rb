module BusinessDays
  module Calculations
    def self.included(base) #:nodoc:

      base.class_eval do
        alias_method :plus_without_business_days, :+
        alias_method :+, :plus_with_business_days

        alias_method :minus_without_business_days, :-
        alias_method :-, :minus_with_business_days
      end
    end

    def is_business_day?
      ! [0,6].include?(self.wday) && ! holiday?
    end

    def plus_with_business_days(other)
      if BusinessDays::Duration === other
        other.calculate_duration(self, :+)
      else
        plus_without_business_days(other)
      end
    end

    def minus_with_business_days(other)
      if BusinessDays::Duration === other
        other.calculate_duration(self, :-)
      else
        minus_without_business_days(other)
      end
    end

    def holiday?
      Config.holidays.include?(self.to_date)
    end
  end
end
