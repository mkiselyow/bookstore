class Book < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :books_in_stock, presence: true
  belongs_to :author
  belongs_to :category
  has_many :ratings

  def price_in_eu
    ActionController::Base.helpers.number_to_currency(
      self.price, locale: :fr
      )
  end
end
