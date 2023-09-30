# frozen_string_literal: true

FactoryBot.define do
  factory :dish do
    user
    name { 'Spaghetti Carbonara' }
    hint { 'Keine Sahne!' }
  end
end
