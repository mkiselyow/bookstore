class Author < ApplicationRecord
  validates :firstname, :lastname, presence: true
  has_many :books

  def full_name
    "#{self.firstname} #{self.lastname}"
  end
end
