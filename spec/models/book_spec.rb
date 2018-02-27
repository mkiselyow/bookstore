require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should have_db_column(:price).of_type(:decimal).with_options(precision: 10, scale: 2, null: false) }
  it { should have_db_column(:title).with_options(null: false) }
  it { should have_db_column(:books_in_stock).with_options(null: false) }
  it { should belong_to(:author) }
  it { should belong_to(:category) }
  it { should have_many(:reviews) }
end
