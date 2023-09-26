# frozen_string_literal: true

module DishesHelper
  def random_dish
    random_id = current_user.dishes.pluck(:id).sample
    Dish.find(random_id) if random_id
  end
end
