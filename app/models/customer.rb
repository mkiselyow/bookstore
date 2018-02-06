class Customer < ApplicationRecord
  # validates :email, uniqueness: true
  validates_uniqueness_of :email
end
