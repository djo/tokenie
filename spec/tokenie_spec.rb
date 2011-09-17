require 'spec_helper'

describe Tokenie do
  describe ".friendly" do
    before(:each) do
      SecureRandom.stub(:base64) { 'qwerty+/=lIO0o' }
    end

    it "generates a string randomically with 6 characters by default" do
      Tokenie.friendly.should eq('qwerty')
    end

    it "generates a string randomically with 2 characters as passed" do
      Tokenie.friendly(:length => 2).should eq('qw')
    end

    it "raises an argument error if length is greater than 16" do
      expect {
        Tokenie.friendly(:length => 17)
      }.to raise_error("'length' must be in range (2..16)")
    end

    it "raises an argument error if length is less than 2" do
      expect {
        Tokenie.friendly(:length => 1)
      }.to raise_error("'length' must be in range (2..16)")
    end
  end
end
