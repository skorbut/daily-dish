# frozen_string_literal: true

class Dish < ApplicationRecord
  has_many :cooked_dishes, dependent: :destroy
  belongs_to :user
end
