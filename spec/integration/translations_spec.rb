require 'rails_helper'

describe "i18l button 'Russian'&'English'", :type => :feature do
  it "changes language" do
    visit '/'
    expect(page).to have_content 'Russian'
    first(:link, 'Russian').click
    expect(page).to have_content 'Русский'
  end
end