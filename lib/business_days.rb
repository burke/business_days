require 'active_support/all'
require 'business_days/config'
require 'business_days/duration'
require 'business_days/calculations'

module BusinessDays

  def business_days
    Duration.new(self)
  end
  alias :business_day :business_days

end

require 'ext/time'
require 'ext/date'
require 'ext/numeric'
