class Customer < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[facebook]
  validates_uniqueness_of :email, case_sensitive: false
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :credit_cards, dependent: :destroy
  after_create :assign_default_role


  def email=(value)
    super(value.downcase)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
      customer.email = auth.info.email
      customer.password = Devise.friendly_token[0,20]
      customer.firstname = auth.info.name.split(' ').first  # assuming the customer model has a name
      customer.lastname = auth.info.name.split(' ').last  # assuming the customer model has a name
      #customer.image = auth.info.image # assuming the customer model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      customer.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |customer|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        customer.email = data["email"] if customer.email.blank?
      end
    end
  end

  def assign_default_role
    self.add_role(:guest) if self.roles.blank?
  end
  # def current_order_progress
  # end
  # def create_order
  # end
end
