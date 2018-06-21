require 'rails_helper'

describe "Devise", :type => :feature do
  it "Sign up" do
    visit '/'
    first(".nav.navbar-nav").click_link 'Sign up'
    password = "12345678"
    fill_in 'Email', with: FactoryBot.attributes_for(:customer)[:email]
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
  end

  it "Sign in" do
    visit '/'
    first(".nav.navbar-nav").click_link 'Sign in'
    password = "12345678"
    customer = create(:customer)
    fill_in 'Email', with: customer.email
    fill_in 'Password', with: password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end