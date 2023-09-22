class DishesController < ApplicationController


  before_action :authenticate_user!
  before_action :set_dish, only: %i[show edit update destroy]

  def new
    @dish = Dish.new
  end

  def edit
  end

  def show
  end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @dish.update(dish_params)
      redirect_to dish_url(@dish)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @Dish.destroy
    redirect_to action: "index"
  end

  def index
    @dishes = Dish.all
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :hint)
  end
end
