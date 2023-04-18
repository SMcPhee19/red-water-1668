# app/controllers/dish/dishes_controller.rb

class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
  end
end