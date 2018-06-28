require 'faker'
Faker::UniqueGenerator.clear
Book.all.each(&:destroy)
Author.all.each(&:destroy)
Category.all.each(&:destroy)
Customer.all.each(&:destroy)
AdminUser.all.each(&:destroy)

['logged in', 'guest'].each do |role|
  Role.find_or_create_by({name: role})
end

['Mobile development', 'Photo', 'Web design', 'Web development'].each do |category_title|
  Category.find_or_create_by({title: category_title})
end

FactoryBot.create_list(:customer_with_everything, 10)
AdminUser.create!(
  email: ACTIVE_ADMIN_LOGIN, 
  password: ACTIVE_ADMIN_PASSWORD, 
  password_confirmation: ACTIVE_ADMIN_PASSWORD) if Rails.env.development? || Rails.env.test?