# frozen_string_literal: true

FactoryBot.define do
  factory :cooked_dish do
    user
    dish
    cooked_at { Time.zone.today }
  end
end
