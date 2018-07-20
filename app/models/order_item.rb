class OrderItem < ApplicationRecord
  validates :price, :quantity, presence: true
  belongs_to :book
  belongs_to :order
  before_create :count_total_price

  def count_total_price
    self.price = self.book.price*self.quantity
  end

  def increment(session = nil)
    if session
      session.map do |hsh| 
        if hsh['book_id'] == self.book_id
          hsh['quantity'] += 1
        end
        hsh
      end
    else
      self.quantity += 1
    end
  end

  def decrement
    if self.quantity > 1
      self.quantity -= 1
    end
  end

  def already_exists?(session = nil)
    existing_records = session.select {|order_item_hsh| order_item_hsh['book_id'] == self.book_id}
    if session
      true if existing_records.any?
    end
  end
end
