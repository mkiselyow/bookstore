class Book < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :books_in_stock, presence: true
  belongs_to :author
  belongs_to :category
  has_many :reviews

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def price_in_eu
    ActionController::Base.helpers.number_to_currency(
      self.price, locale: :fr
      )
  end

  def image_attributes=(attributes)
    image.clear if has_destroy_flag?(attributes) && !image.dirty?
  end
end
