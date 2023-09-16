class CookedDishesController < ApplicationController

  before_action :set_cooked_dish, only: %i[show destroy]

  def new
    @cooked_dish = CookedDish.new
  end

  def show
  end

  def create
    @cooked_dish = CookedDish.new(cooked_dish_params)
    @cooked_dish.cooked_at = Time.zone.today if @cooked_dish.cooked_at.nil?

    if @cooked_dish.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @cooked_dish.destroy
    redirect_to action: "index"
  end

  def index
    @cooked_dishes = CookedDish.where(cooked_at: (Date.today.beginning_of_month..Date.today.end_of_month))
    @month = I18n.l Time.zone.today, :format => "%B"
  end

  def set_cooked_dish
    @cooked_dish = CookedDish.find(params[:id])
  end

  def cooked_dish_params
    params.require(:cooked_dish).permit(:dish_id, :cooked_at)
  end
end

