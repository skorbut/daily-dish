module DishesHelper
  def random_dish
    random_id = Dish.all.pluck(:id).sample
    Dish.find(random_id)
  end
end
