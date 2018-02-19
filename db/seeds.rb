# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create(
  title: "SomeTitle")
authors = Author.create(
  firstname: "SomeName", 
  lastname: "SomeSurname" )
customers = Customer.create( 
  email: "SomeEmail", 
  password: "SomePassword", 
  firstname: "SomeName", 
  lastname: "SomeSurname")
Book.create(
  title: "SomeBook",
  description: "BookDescription",
  price: 10,
  books_in_stock: 10,
  author_id: authors,
  category_id: categories)
Rating.create(
  text_review: "SampleReview", 
  rating_number: "1",
  book_id: 1, 
  customer_id: customers)
AdminUser.create!(email: ACTIVE_ADMIN_LOGIN, password: ACTIVE_ADMIN_PASSWORD, password_confirmation: ACTIVE_ADMIN_PASSWORD) if Rails.env.development? || Rails.env.test?