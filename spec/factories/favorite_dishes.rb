# frozen_string_literal: true

FactoryBot.define do
  factory :favorite_dish do
    user
    dish
  end
end
