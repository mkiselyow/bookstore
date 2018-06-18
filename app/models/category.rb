class Category < ApplicationRecord
  validates_uniqueness_of :title
end
