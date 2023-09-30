# frozen_string_literal: true

class FavoriteDishesController < ApplicationController
  def index
    @favorite_dishes = current_user.favorite_dishes
  end

  def create
    dish = Dish.find(params[:dish_id])
    FavoriteDish.create(dish: dish, user: current_user)
    redirect_to dish_url(dish)
  end

  def destroy
    destroyed_favorite_dish = FavoriteDish.find(params[:id]).destroy
    redirect_to dish_url(destroyed_favorite_dish.dish)
  end

  def favorite_dish_params
    params.require(:favorite_dish).permit(:dish_id)
  end
end
