class Customer < ApplicationRecord
  # validates :email, uniqueness: true
  validates_uniqueness_of :email
  has_many :orders
  has_many :ratings

  def create_order
  end

  def current_order_progress
  end
end
