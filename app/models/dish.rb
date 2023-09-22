class Dish < ApplicationRecord
  has_many :cooked_dishes
  belongs_to :user
end
