require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_db_column(:title).with_options(null: false) }

  describe "validations" do
    subject { Category.create(title: "SampleTitle") }
    it { should validate_uniqueness_of(:title) }
  end
end
