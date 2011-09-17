require 'tokenie'

describe Tokenie do
  describe ".friendly" do
    it "generates a friendly string randomically" do
      SecureRandom.stub(:base64).and_return('qwerty+/=lIO0o')
      Tokenie.friendly.should eq('qwertyabcdefgh')
    end
  end
end
