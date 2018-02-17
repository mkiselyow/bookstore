class CreditCard < ApplicationRecord
  validates :number, presence: true
  validates :cvv, presence: true
  validates :expiration_month, presence: true
  validates :expiration_year, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  has_many :orders
  belongs_to :customer
end
