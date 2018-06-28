class CreditCard < ApplicationRecord
  validates :number,:cvv, :expiration_month, :expiration_year, :firstname, :lastname, presence: true
  has_many :orders, dependent: :destroy
  belongs_to :customer
end
