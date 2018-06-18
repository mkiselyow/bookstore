require 'rails_helper'
require 'shared_staff'

describe "Images integration test", :type => :feature do
  include_context "shared stuff"

  it "Admin can create Book with Image" do
    # visit '/'
    # expect(page).to have_content 'Russian'
    # first(:link, 'Russian').click
    # expect(page).to have_content 'Русский'
  end
  
  it "Admin can create Book without Image" do
    # visit '/'
    # expect(page).to have_content 'Russian'
    # first(:link, 'Russian').click
    # expect(page).to have_content 'Русский'
  end
end