# app/models/dish_ingredient.rb

class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
end
