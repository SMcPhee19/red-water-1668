require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before(:each) do
    @john = Chef.create!(name: 'John Doe')
    @pasta = @john.dishes.create!(name: 'Spaghetti Bolognese', description: 'Classic Italian pasta dish')
    @tomato = Ingredient.create!(name: 'Tomato', calories: 20)
    @beef = Ingredient.create!(name: 'Beef', calories: 100)
    @spag = Ingredient.create!(name: 'Spaghetti', calories: 200)

    @pasta.ingredients << [@tomato, @beef, @spag]
  end

  it 'shows the dish name and description' do
    visit dish_path(@pasta)
    within '#dish-info' do
      save_and_open_page
      expect(page).to have_content(@pasta.name)
      expect(page).to have_content(@pasta.description)
      expect(page).to have_content(@pasta.chef.name)
      expect(page).to have_content(@tomato.name)
      expect(page).to have_content(@beef.name)
      expect(page).to have_content(@spag.name)
      expect(page).to have_content(@pasta.total_calories)
    end
  end
end