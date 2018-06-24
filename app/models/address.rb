class Address < ApplicationRecord
  validates :firstname, :lastname, :address, :zipcode, :city, :phone, :country, presence: true
end
