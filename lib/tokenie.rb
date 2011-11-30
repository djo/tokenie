require "tokenie/version"
require 'securerandom'

module Tokenie
  # Generates a friendly string randomically
  def self.friendly(options = {})
    length = options[:length] || 6
    raise ArgumentError, "'length' must be in range (2..16)" if length < 2 || length > 16

    loop do
      token = SecureRandom.base64(15).tr('+/=1lIO0o', 'abcdefghj')[0, length]
      break token unless block_given? && yield(token)
    end
  end
end
