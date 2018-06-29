require 'rails_helper'

describe "guest_customer", :type => :feature do
  it "have been created on not-authorized visit" do
    visit '/'
    expect(page.get_rack_session_key('guest_customer')).not_to eq(nil)
    expect(page.get_rack_session_key('guest_customer').to_hash["email"]).to match(/guest_customer_\d{12}@example.com/)
  end
end