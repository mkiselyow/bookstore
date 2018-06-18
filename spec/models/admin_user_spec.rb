require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it 'we have one Active Admin User' do
    expect(described_class.all.count).to eq(1)
  end
end
