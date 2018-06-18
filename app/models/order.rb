class Order < ApplicationRecord
  validates :total_price, presence: true
  validates :completed_date, presence: true
  enum state: ["in progress", "complited", "shipped"]
  validates :state, presence: true, inclusion: { in: Order.states.keys,
  :message => "%{value} is not in_progress/complited/shipped" }
  has_many :order_items
  has_one :shipping_address
  has_one :billing_address
  belongs_to :customer
  belongs_to :credit_card

  # def add_book_to_the_order
  # end
end
