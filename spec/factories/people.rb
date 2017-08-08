require 'faker'

FactoryGirl.define do
  factory :person do
    name Faker::Name.name
    email Faker::Internet.email
    telephone_number Faker::PhoneNumber.cell_phone
    website Faker::Internet.domain_name
  end
end
