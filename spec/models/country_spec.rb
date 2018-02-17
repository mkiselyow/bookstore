require 'rails_helper'

RSpec.describe Country, type: :model do
  it { should validate_presence_of(:name) }
  describe "validations" do
    subject { Country.create(name: "SomeACountry") }
    it { should validate_uniqueness_of(:name) }
  end
end
