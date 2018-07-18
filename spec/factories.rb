require 'faker'

FactoryBot.define do
  factory :role do
  end
  
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
    sold           {Faker::Number.between(0, 10)}
    books_in_stock {Faker::Number.between(1, 25)}
    association :author, factory: :author
    category_id {Category.count > 3 ? Category.all.sample.id : FactoryBot.create(:category).id}
    description {Faker::Lorem.paragraph(15, true, 10)}
    year_of_publication {Time.new(Faker::Number.between(1955, 2018))}
  end

  factory :category, :class => 'Category' do
    title {Faker::Book.unique.genre}
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

  factory :order_item, class: 'OrderItem' do
    price 0
    quantity {Faker::Number.between(1, 3)}
    association :order
    association :book
  end

  factory :order, class: 'Order' do
    total_price     {Faker::Commerce.price}
    completed_date  { Faker::Date.between(2.days.ago, Date.today)}
    state           { %w(in_progress complited shipped).sample }
    association :customer
    association :credit_card
  end

  factory :order_with_order_items, class: 'Order' do
    total_price     {Faker::Commerce.price}
    completed_date  { Faker::Date.between(2.days.ago, Date.today)}
    state           { %w(in_progress complited shipped).sample }
    association :customer
    association :credit_card
    after :create do |order_with_order_items|
      create_list :order_item, 3, order: order_with_order_items
    end
  end

  factory :credit_card, class: 'CreditCard' do
    number            {Faker::Business.credit_card_number}
    cvv               {Faker::Number.number(3)}
    expiration_month  {Faker::Business.credit_card_expiry_date.month}
    expiration_year   {Faker::Business.credit_card_expiry_date.year}
    firstname
    lastname
    association :customer
  end

  factory :customer_with_everything, :class => 'Customer' do
    email
    firstname              
    lastname               
    password '12345678'
    confirmed_at Time.now
    after :create do |customer_with_everything|
      create_list :credit_card, 1, customer: customer_with_everything
      create_list :order_with_order_items, 3,
       customer: customer_with_everything,
        credit_card: customer_with_everything.credit_cards.first
      create_list :review, (Book.count*2)
    end
  end

  factory :review, class: 'Review' do
    text_review   {Faker::Lorem.paragraph(2, true, 6)}
    rating_number {Faker::Number.between(1, 10)}
    customer_id       {Customer.count > 1 ? Customer.all.sample.id : FactoryBot.create(:customer).id}
    book_id   {Book.count > 1 ? Book.all.sample.id : FactoryBot.create(:book).id}
  end
end