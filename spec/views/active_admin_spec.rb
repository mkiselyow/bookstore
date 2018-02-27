require 'rails_helper'

describe "active_admin", :type => :feature do
  # before(:each) {load Rails.root + "db/seeds.rb"}

  it "active_admin can login and we have db:seeds" do
    visit '/admin/login'
    fill_in 'admin_user_email', :with => ACTIVE_ADMIN_LOGIN
    fill_in 'admin_user_password', :with => ACTIVE_ADMIN_PASSWORD
    click_button 'Login'
    expect(page).to have_content 'Dashboard'
  end

  it 'active_admin can create books' do
    visit '/admin/login'
    fill_in 'admin_user_email', :with => ACTIVE_ADMIN_LOGIN
    fill_in 'admin_user_password', :with => ACTIVE_ADMIN_PASSWORD
    click_button 'Login'
    click_link 'Books'
    click_link 'New Book'
    expect(page).to have_content 'Author*'
  end
end