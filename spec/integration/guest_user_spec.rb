require 'rails_helper'

describe "guest_customer", :type => :feature do
  it "have been created on not-authorized visit" do
    expect{visit '/'}.to change{ Customer.count }.by(1)
    # to make test successful add before_action :current_or_guest_customer
  end

  it "have been created on not-authorized visit" do
    visit '/'
  end
end