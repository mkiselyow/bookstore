require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_db_column(:email).with_options(null: false) }
  it { should have_db_column(:password).with_options(null: false) }
  it { should have_db_column(:firstname).with_options(null: false) }
  it { should have_db_column(:lastname).with_options(null: false) }
  it { should have_many(:orders) }
  it { should have_many(:ratings) }
  describe "validations" do
    subject { Customer.create( 
                email:      "SomeAEmail", 
                password:   "SomePassword", 
                firstname:  "SomeName", 
                lastname:   "SomeSurname") }
    it { should validate_uniqueness_of(:email) }
  end
end
