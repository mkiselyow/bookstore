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
    title         {Faker::Book.unique.title}
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
    firstname
    lastname
  end

  factory :customer, :class => 'Customer' do
    email
    firstname              
    lastname               
    password '12345678'
    confirmed_at Time.now
  end
end