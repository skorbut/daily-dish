# frozen_string_literal: true

class FavoriteDishesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_dishes = current_user.favorite_dishes
  end

  def create
    dish = Dish.find(params[:dish_id])
    FavoriteDish.create(dish:, user: current_user)
    redirect_to dish_url(dish)
  end

  def destroy
    destroyed_favorite_dish = FavoriteDish.find(params[:id]).destroy
    redirect_to dish_url(destroyed_favorite_dish.dish)
  end
end
