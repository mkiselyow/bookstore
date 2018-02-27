require 'faker'

FactoryBot.define do
  factory :admin_user do
    
  end
  sequence :email do |n|
    "person#{n}@gmail.com"
  end

  factory :book, :class => 'Book' do
    title          Faker::Book.title
    description    Faker::Book.genre
    price          Faker::Commerce.price
    books_in_stock Faker::Number.between(1, 25)
    author_id      Author.all.sample
    category_id    Category.all.sample
  end

  factory :category, :class => 'Category' do
    title          Faker::Book.genre
  end

  factory :author, :class => 'Author' do
    full_name = Faker::Book.author
    words_full_name = full_name.split(' ').length
    firstname         words_full_name == 2 ? full_name.split(' ').first : full_name.split(' ').first(2)
    lastname          full_name.split(' ').last
  end

  factory :customer, :class => 'Customer' do
    email
    firstname              "Test Customer"
    lastname               "SomeSurname"
    encrypted_password     '12345678'
    password_confirmation  '12345678'
  end
end