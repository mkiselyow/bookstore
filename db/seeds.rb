require 'faker'

Book.all.each(&:destroy)
Author.all.each(&:destroy)
Category.all.each(&:destroy)
FactoryBot.create_list(:book, 20)
password = "foobar"
Customer.all.each(&:destroy)
FactoryBot.create_list(:customer, 5, password: password, password_confirmation: password)
AdminUser.create!(
  email: ACTIVE_ADMIN_LOGIN, 
  password: ACTIVE_ADMIN_PASSWORD, 
  password_confirmation: ACTIVE_ADMIN_PASSWORD) if Rails.env.development? || Rails.env.test?