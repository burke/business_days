module BusinessDays
  module Date
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
        # TODO: Holidays.
        ! [0,6].include?(self.wday)
      end 
      
      def plus_with_business_days(other)
        if BusinessDays::BusinessDayDuration === other
          other.calculate_duration(self, :+)
        else
          plus_without_business_days(other)
        end
      end
 
      def minus_with_business_days(other)
        if BusinessDays::BusinessDayDuration === other
          other.calculate_duration(self, :-)
        else
          minus_without_business_days(other)
        end
      end
    end

  end 
end

class Date
  include BusinessDays::Date::Calculations
end 
