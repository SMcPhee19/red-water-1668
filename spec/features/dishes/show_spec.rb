require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before(:each) do
    @masaharu = Chef.create!(name: 'Masaharu Morimoto')
    @tako = @masaharu.dishes.create!(name: 'Takoyaki', description: 'Quintesential Japanese street food')
    @octopus = Ingredient.create!(name: 'Octopus', calories: 100)
    @batter = Ingredient.create!(name: 'Takoyaki Batter', calories: 200)
    @egg = Ingredient.create!(name: 'Egg', calories: 50)
    @bonito = Ingredient.create!(name: 'Bonito Flakes', calories: 10)

    @tako.ingredients << [@octopus, @batter, @egg]
  end

  it 'shows the dish name and description' do
    visit dish_path(@tako)
    within '#dish-info' do
      expect(page).to have_content(@tako.name)
      expect(page).to have_content(@tako.description)
      expect(page).to have_content(@tako.chef.name)
      expect(page).to have_content(@octopus.name)
      expect(page).to have_content(@batter.name)
      expect(page).to have_content(@egg.name)
      expect(page).to have_content(@tako.total_calories)
    end
  end

  # it 'user can see a form in the dish show page' do
  #   visit dish_path(@tako)

  #   within '#add-ingredient' do
  #     expect(page).to have_select('dish_ingredient_id', options: [@octopus.name, @batter.name, @egg.name, @bonito.name])
  #     expect(page).to have_button('Update Dish')
  #   end
  # end

  # it 'user can add an ingredient to the dish' do
  #   visit dish_path(@tako)

  #   within '#add-ingredient' do
  #     fill_in :ingredient, with: '@bonito.id'
  #     click_button 'Add Ingredient'
  #   end
  #   expect(current_path).to eq(dish_path(@tako))
  #   expect(page).to have_content('Bonito Flakes')
  # end
end