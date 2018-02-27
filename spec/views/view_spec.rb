require 'rails_helper'

describe "the home page", :type => :feature do
  before :each do
    password = "foobarfoobar"
    create(
      :customer, 
      password: password, 
      password_confirmation: password)
  end

  it "flash message renders" do
    visit '/'
    expect(page).to have_content 'Post successfully created'
  end
end