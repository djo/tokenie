require "tokenie/version"
require 'securerandom'

module Tokenie
  # Generates a friendly string randomically
  def self.friendly(options = {})
    length = options[:length] || 6
    raise ArgumentError, "'length' must be in range (2..16)" if length < 2 || length > 16

    SecureRandom.base64(15).tr('+/=lIO0o', 'abcdefgh')[0, length]
  end
end
