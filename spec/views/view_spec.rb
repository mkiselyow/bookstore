require 'rails_helper'

describe "the home page", :type => :feature do
  before :each do
    password = "foobarfoobar"
    create(
      :customer, 
      password: password, 
      password_confirmation: password)
  end

  it "home page renders" do
    visit '/'
    # within("#session") do
    #   fill_in 'Email', with: 'user@example.com'
    #   fill_in 'Password', with: 'password'
    # end
    # click_button 'Sign in'
    expect(page).to have_content 'Checkout'
    expect(page).to have_content 'Post successfully created'
  end
end