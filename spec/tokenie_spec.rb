require 'spec_helper'

describe Tokenie do
  describe ".friendly" do
    it "generates a token with 6 characters by default" do
      SecureRandom.stub(:base64) { 'qwertytoken' }
      Tokenie.friendly.should eq('qwerty')
    end

    it "generates a token with 2 characters as passed" do
      SecureRandom.stub(:base64) { 'qwerty' }
      Tokenie.friendly(:length => 2).should eq('qw')
    end

    it "generates a friendly token" do
      SecureRandom.stub(:base64) { '+/=1lIO0o' }
      Tokenie.friendly(:length => 9).should eq('abcdefghj')
    end

    it "generates an unique token" do
      existing_tokens = ['qwerty', 'abcdef']
      generation_line = ['qwerty', 'abcdef', 'abcdeg', 'abcdek']
      SecureRandom.stub(:base64) { generation_line.shift }

      token = Tokenie.friendly { |t| existing_tokens.include?(t) }
      token.should eq('abcdeg')
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
