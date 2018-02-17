require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:country) }
  it { should belong_to(:order) }

  describe 'shipping_address' do
     subject { described_class.new(id: 1, type: Address) }    # or however you want to make this
        it { should validate_presence_of(:address) }
        it { should validate_presence_of(:zipcode) }
        it { should validate_presence_of(:city) }
        it { should validate_presence_of(:phone) }
        it { should validate_presence_of(:country) }
        it { should belong_to(:order) }
    end
  end
end
