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

require 'core_ext/time'
require 'core_ext/date'
require 'core_ext/numeric'
