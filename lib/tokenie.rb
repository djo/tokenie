require "tokenie/version"
require 'securerandom'

module Tokenie
  # Generates a friendly string randomically
  def self.friendly
    SecureRandom.base64(15).tr('+/=lIO0o', 'abcdefgh')
  end
end
