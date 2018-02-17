class Category < ApplicationRecord
  # validates :title, uniqueness: true
  validates_uniqueness_of :title
end
