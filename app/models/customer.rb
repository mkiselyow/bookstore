class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  # validates :email, uniqueness: true
  validates_uniqueness_of :email
  has_many :orders
  has_many :ratings

  # def create_order
  # end

  # def current_order_progress
  # end

  def email=(value)
    super(value.downcase)
  end
end
