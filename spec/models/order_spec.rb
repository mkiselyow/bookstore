require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_presence_of(:total_price) }
  it { should validate_presence_of(:completed_date) }
  it { should validate_presence_of(:state) }
  it { should allow_value("in_progress", "complited", "shipped").for(:state) }
  
  it { should have_db_column(:total_price).of_type(:decimal).with_options(precision: 10, scale: 2, null: false) }
  it { should have_db_column(:completed_date).with_options(null: false) }
  it { should have_db_column(:state) }
  it { should belong_to(:credit_card) }
  it { should belong_to(:customer) }
  it { should have_many(:order_items) }
  it { should have_one(:shipping_address) }
  it { should have_one(:billing_address) }
end
