require 'securerandom'

class Url < ApplicationRecord
  has_many :visits

  # Validations
  validates :long_url, presence: true, uniqueness: true

  # Uses Ruby's SecureRandom library to generate an 8 character random string
  def generate_short_url_token
    SecureRandom.alphanumeric(8)
  end
end
