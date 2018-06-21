require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_db_column(:email).with_options(null: false) }
  it { should have_db_column(:firstname) }
  it { should have_db_column(:lastname) }
  it { should have_many(:orders) }
  it { should have_many(:reviews) }
  describe "validations" do
    password = "foobarfoobar"
    subject { create(
      :customer, 
      password: password, 
      password_confirmation: password) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
end
