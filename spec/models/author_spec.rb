require 'rails_helper'

RSpec.describe Author, type: :model do
  it { should have_db_column(:firstname).with_options(null: false) }
  it { should have_db_column(:lastname).with_options(null: false) }
  it { should have_db_column(:biography) }
  it { should have_many(:books) }
end
