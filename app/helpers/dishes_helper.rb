module DishesHelper
  def random_dish
    random_id = current_user.dishes.all.pluck(:id).sample
    Dish.find(random_id) if random_id
  end

  def is_stared?(user, dish)
    FavoriteDish.find_by(user: user, dish: dish)
  end
end
