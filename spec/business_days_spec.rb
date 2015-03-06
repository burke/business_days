require 'spec_helper'
require File.join(File.dirname(__FILE__),'..','lib','business_days')

describe BusinessDays do
  describe "with Time" do
    before do
      @friday = Time.parse("Friday, September 10th, 2010")
      @thursday = @friday - 1.day
      @saturday = @friday + 1.day
      @monday = @friday + 3.days
      @tuesday = @friday + 4.days
      @wednesday = @friday + 5.days
      BusinessDays::Config.holidays = @monday.to_date
    end

    it "should add properly" do
      (@friday + 1.business_day).should == @tuesday
      (@friday + 2.business_days).should == @wednesday
      (@saturday + 1.business_days).should == @wednesday
      (@saturday + 0.business_days).should == @tuesday
    end

    it "should subtract properly" do
      (@saturday - 1.business_day).should == @thursday
      (@saturday - 0.business_days).should == @friday
      (@monday - 1.business_days).should == @thursday
      (@monday - 0.business_days).should == @friday
    end

    it "should add with the params reversed" do
      (1.business_day + @friday).should == @tuesday
    end
  end

  describe "with Date" do
    before do
      @friday = Date.parse("Friday, September 10th, 2010")
      @thursday = @friday - 1.day
      @saturday = @friday + 1.day
      @monday = @friday + 3.days
      @tuesday = @friday + 4.days
      @wednesday = @friday + 5.days
      BusinessDays::Config.holidays = @monday
    end

    it "should add properly" do
      (@friday + 1.business_day).should == @tuesday
      (@friday + 2.business_days).should == @wednesday
      (@saturday + 1.business_days).should == @wednesday
      (@saturday + 0.business_days).should == @tuesday
    end

    it "should subtract properly" do
      (@saturday - 1.business_day).should == @thursday
      (@saturday - 0.business_days).should == @friday
      (@monday - 1.business_days).should == @thursday
      (@monday - 0.business_days).should == @friday
    end

    it "should add with the params reversed" do
      (1.business_day + @friday).should == @tuesday
    end
  end

end
