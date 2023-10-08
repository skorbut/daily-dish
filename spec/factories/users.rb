# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.first_name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 8) }
  end
end
