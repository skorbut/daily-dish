module DishesHelper
  def random_dish
    random_id = current_user.dishes.all.pluck(:id).sample
    Dish.find(random_id) if random_id
  end
end
