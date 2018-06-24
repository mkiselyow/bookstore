require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_db_column(:name) }

  it 'adds default role => guest to new customer' do
    some_new_customer = FactoryBot.create(:customer)
    expect(some_new_customer.has_role? :guest).to eq(true)
  end
end
