require 'active_support/all'
require File.join(File.dirname(__FILE__),'business_days','time')

module BusinessDays
  
  class BusinessDayDuration
    def initialize(days)
      @days = days
    end 

    def calculate_duration(time, operation)
      business_days = time.is_business_day? ? 1 : 0
      while business_days <= @days
        if (time = time.send(operation, 1.day)).is_business_day?
          business_days += 1
        end 
      end 
      time
    end 
    
    def +(time)
      calculate_duration(time, :+)
    end 

  end 
  
  def business_days
    BusinessDayDuration.new(self)
  end 
  alias :business_day :business_days

end 

class Numeric
  include BusinessDays
end 
