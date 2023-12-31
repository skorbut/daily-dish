# frozen_string_literal: true

class CookedDishesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cooked_dish, only: :destroy

  def index
    @cooked_dishes = current_user.cooked_dishes.where(cooked_at: Time.zone.today.all_month)
    @month = I18n.l Time.zone.today, format: '%B'
  end

  def create
    @cooked_dish = CookedDish.new(cooked_dish_params)
    @cooked_dish.user = current_user
    @cooked_dish.cooked_at = Time.zone.today if @cooked_dish.cooked_at.nil?

    if @cooked_dish.save
      redirect_to action: 'index'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @cooked_dish.destroy
    redirect_to action: 'index'
  end

  def set_cooked_dish
    @cooked_dish = CookedDish.find(params[:id])
  end

  def cooked_dish_params
    params.require(:cooked_dish).permit(:dish_id, :cooked_at)
  end
end
