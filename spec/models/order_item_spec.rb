require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:quantity) }
  it { should have_db_column(:price).of_type(:decimal).with_options(precision: 10, scale: 2, null: false) }
  it { should have_db_column(:quantity).with_options(null: false) }
  it { should belong_to(:book) }
  it { should belong_to(:order) }
end
