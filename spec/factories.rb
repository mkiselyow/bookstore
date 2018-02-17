FactoryBot.define do
  sequence :email do |n|
    "person#{n}@gmail.com"
  end
end

FactoryBot.define do
  factory :customer, :class => 'Customer' do
    email
    firstname              "Test Customer"
    lastname               "SomeSurname"
    encrypted_password     '12345678'
    password_confirmation  '12345678'
  end
end