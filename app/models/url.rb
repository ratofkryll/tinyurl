require 'uri'

class Url < ApplicationRecord
  has_many :visits

  # Validations
  validates :long_url, presence: true, uniqueness: true

  validate :validate_url

  def is_valid_url?
    uri = URI.parse(self.long_url)
    return uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    return false
  end

  def validate_url
    errors.add(:long_url, 'is invalid. Please make sure it begins with https:// or http://') unless is_valid_url?
  end

  # Convert base 10 to base 36 "short URL" - This creates a shorter URL, which is generated faster, and won't result in uniqueness conflicts
  def to_param
    # Return a string, as base 36 will be alphanumeric
    id.to_s(36)
  end
end
