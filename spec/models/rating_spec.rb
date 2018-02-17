require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { should validate_inclusion_of(:rating_number).in_range(1..10) }
  it { should have_db_column(:text_review) }
  it { should have_db_column(:rating_number) }
  it { should belong_to(:customer) }
  it { should belong_to(:book) }
end
