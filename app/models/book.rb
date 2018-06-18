class Book < ApplicationRecord
  validates :title, :price, :books_in_stock, presence: true
  belongs_to :author
  belongs_to :category
  has_many :reviews
  has_many :images, dependent: :delete_all
  accepts_nested_attributes_for :images, :allow_destroy => true

  # default_scope { where books_in_stock: 3 }
  default_scope { order(created_at: :desc) }
  scope :ordered_by_title, -> { reorder(title: :asc) }
  # scope :created_at, -> { where(created_at: true) }

  def price_in_eu
    ActionController::Base.helpers.number_to_currency(
      self.price, locale: :fr
      )
  end

  def default_image_url(style)
    "https://s3.eu-central-1.amazonaws.com/bookstore-kiselyow/books/images/default/#{style}/no_image.jpg"
  end
end
