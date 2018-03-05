class Book < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :books_in_stock, presence: true
  belongs_to :author
  belongs_to :category
  has_many :reviews
  has_many :images, dependent: :delete_all
  accepts_nested_attributes_for :images, :allow_destroy => true

  def price_in_eu
    ActionController::Base.helpers.number_to_currency(
      self.price, locale: :fr
      )
  end

  def default_image_url(style)
    "https://s3.eu-central-1.amazonaws.com/bookstore-kiselyow/books/images/default/#{style}/no_image.jpg"
  end
end
