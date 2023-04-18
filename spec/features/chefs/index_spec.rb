require 'rails_helper'

RSpec.describe 'Chefs Ingredient Index Page' do
  before(:each) do
    @masaharu = Chef.create!(name: 'Masaharu Morimoto')
    @tako = @masaharu.dishes.create!(name: 'Takoyaki', description: 'Quintessential Japanese street food')
    @octopus = Ingredient.create!(name: 'Octopus', calories: 100)
    @batter = Ingredient.create!(name: 'Takoyaki Batter', calories: 200)
    @egg = Ingredient.create!(name: 'Egg', calories: 50)
    @bonito = Ingredient.create!(name: 'Bonito Flakes', calories: 10)

    @tako.ingredients << [@octopus, @batter, @egg]
  end

  it 'shows a unique list of all ingredients that the chef uses' do
    visit chef_ingredients_path(@masaharu)
    expect(page).to have_content("Ingredients Used by Chef #{@masaharu.name}")

    within '#ingredients' do
      expect(page).to have_content(@octopus.name)
      expect(page).to have_content(@batter.name)
      expect(page).to have_content(@egg.name)
      expect(page).to_not have_content(@bonito.name)
    end
  end
end
