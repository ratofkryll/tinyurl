require 'securerandom'

class Url < ApplicationRecord
  has_many :visits

  # Validations
  validates :long_url, presence: true, uniqueness: true

  # Convert base 10 to base 36 "short URL" - This creates a shorter URL, which is generated faster, and won't result in uniqueness conflicts
  def to_param
    # Return a string, as base 36 will be alphanumeric
    id.to_s(36)
  end
end
