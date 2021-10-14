class Url < ApplicationRecord
  
  # Validations
  validates :long_url, presence: true
end
