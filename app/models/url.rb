class Url < ApplicationRecord
  has_many :visits

  # Validations
  validates :long_url, presence: true
end
