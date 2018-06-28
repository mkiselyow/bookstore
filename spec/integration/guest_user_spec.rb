require 'rails_helper'

describe "guest_customer", :type => :feature do
  it "have been created on not-authorized visit" do
    # expect{ visit '/' }.to change{ page.get_rack_session_key('guest_customer') }
    visit '/'
    expect(page.get_rack_session_key('guest_customer')).not_to eq(nil)
  end

  # it "have been created on not-authorized visit" do
  #   visit '/'
  # end
end