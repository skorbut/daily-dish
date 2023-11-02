# frozen_string_literal: true

class DishesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_dish, only: %i[show edit update destroy]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @dishes = if params[:user_id]
                User.find(params[:user_id]).dishes
              else
                Dish.all
              end
  end

  def show; end

  def new
    @dish = Dish.new
  end

  def edit
    authorize @dish
  end

  def create
    @dish = Dish.new(dish_params)
    @dish.user = current_user

    if @dish.save
      redirect_to action: 'index'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @dish
    if @dish.update(dish_params)
      redirect_to dish_url(@dish)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @Dish.destroy
    redirect_to action: 'index'
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :hint)
  end

  def user_not_authorized
    flash[:alert] = I18n.t('authorization.fail.dish.edit', user_name: @dish.user.name)
    redirect_back(fallback_location: dish_path(@dish))
  end
end
