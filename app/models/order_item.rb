class OrderItem < ApplicationRecord
  validates :price, :quantity, presence: true
  belongs_to :book
  belongs_to :order
  before_create :count_total_price

  def count_total_price
    self.price = self.book.price*self.quantity
  end
end
