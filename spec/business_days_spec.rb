require 'spec_helper'
require File.join(File.dirname(__FILE__),'..','lib','business_days')

describe BusinessDays do

  before do
    @friday = Time.parse("Friday, September 10th, 2010")
    @thursday = @friday - 1.day
    @saturday = @friday + 1.day
    @monday = @friday + 3.days
    @tuesday = @friday + 4.days
  end 
  
  it "should add properly" do
    (@friday + 1.business_day).should == @monday
    (@friday + 2.business_days).should == @tuesday
    (@saturday + 1.business_days).should == @tuesday
    (@saturday + 0.business_days).should == @monday
  end 

  it "should subtract properly" do
    (@saturday - 0.business_days).should == @friday
    (@saturday - 1.business_day).should == @thursday
    (@monday - 1.business_days).should == @friday
    (@monday - 0.business_days).should == @monday
  end 

  it "should add with the params reversed" do
    (1.business_day + @friday).should == @monday
  end 
  
end 
