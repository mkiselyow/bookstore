class Book < ApplicationRecord
  validates :title, :price, :books_in_stock, presence: true
  belongs_to :author
  belongs_to :category

  has_many :reviews
  has_many :order_items, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  # default_scope { where books_in_stock: 3 }
  default_scope { order(created_at: :desc) }
  scope :latest_added, -> { reorder(created_at: :desc) }
  scope :ordered_by_title, -> { reorder(title: :asc) }
  scope :best_seller_mobile,
   -> { reorder(sold: :desc).
    where(category_id: Category.where(title: 'Mobile development')) }
  scope :best_seller_photo,
   -> { reorder(sold: :desc).
    where(category_id: Category.where(title: 'Photo')) }
  scope :best_seller_design,
   -> { reorder(sold: :desc).
    where(category_id: Category.where(title: 'Web design')) }
  scope :best_seller_web,
   -> { reorder(sold: :desc).
    where(category_id: Category.where(title: 'Web development')) }
  scope :most_popular, -> { reorder(sold: :desc) }
  scope :hight_to_low, -> { reorder(price: :desc) }
  scope :low_to_hight, -> { reorder(price: :asc) }

  def price_in_eu
    ActionController::Base.helpers.number_to_currency(
      self.price, locale: :fr
      )
  end

  def default_image_url(style)
    "https://s3.eu-central-1.amazonaws.com/bookstore-rubygarage/books/images/default/#{style}/no_image.jpg"
  end

  # def self.best_sellers
  #   h = {}
  #   h.default = 0;
  #   OrderItem.pluck(:book_id).each { |key| h[key] += 1 }
  #   book_ids = h.sort_by { |key, value| value }.reverse.to_h.keys
  #   book_ids.collect { |id| Book.find(id) }
  # end

  # def filter(filter_name)
  #   case filter_name
  #   when :all
  #     scoped
  #   when :published
  #     where(:published => true)
  #   when :unpublished
  #     where(:published => false)
  #   when :cheap_products
  #     where(price: 0..50.00).order(price: :asc)
  #   when :expensive_products
  #     where(price: 50.01..1.0/0.0).order(price: :asc)
  #   else
  #     none
  #   end
  # end
end
