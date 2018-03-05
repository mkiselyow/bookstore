require 'faker'

FactoryBot.define do
  factory :admin_user do
    
  end

  sequence :email do |n| 
    Faker::Internet.unique.email
  end

  sequence :firstname, aliases: [:first_name] do |n|
    Faker::Name.first_name
  end

  sequence :lastname, aliases: [:last_name] do |n|
    Faker::Name.last_name
  end

  factory :book, :class => 'Book' do
    title         { Faker::Book.unique.title}
    price          {Faker::Commerce.price}
    books_in_stock {Faker::Number.between(1, 25)}
    association :author, factory: :author
    association :category, factory: :category
    # author_id      Author.all.sample.id if Author.all.count >= 1
    # category_id    Category.all.sample.id if Category.all.count >= 1
  end

  factory :category, :class => 'Category' do
    title          {Faker::Book.unique.genre}
  end

  factory :author, :class => 'Author' do
    full_name = Faker::Book.author
    words_full_name = full_name.split(' ').length
    firstname         words_full_name == 2 ? full_name.split(' ').first : full_name.split(' ').first(2)
    lastname          full_name.split(' ').last
  end

  factory :customer, :class => 'Customer' do
    email
    firstname              
    lastname               
    encrypted_password     '12345678'
    password_confirmation  '12345678'
  end
end