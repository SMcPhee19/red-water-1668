require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  before(:each) do
    @masaharu = Chef.create!(name: 'Masaharu Morimoto')
    @tako = @masaharu.dishes.create!(name: 'Takoyaki', description: 'Quintessential Japanese street food')
    @octopus = Ingredient.create!(name: 'Octopus', calories: 100)
    @batter = Ingredient.create!(name: 'Takoyaki Batter', calories: 200)
    @egg = Ingredient.create!(name: 'Egg', calories: 50)
    @bonito = Ingredient.create!(name: 'Bonito Flakes', calories: 10)

    @tako.ingredients << [@octopus, @batter, @egg]
  end

  it 'shows the chef name and a link to their ingredients' do
    visit chef_path(@masaharu)
    expect(page).to have_content(@masaharu.name)
    click_link 'All Ingredients'
    expect(page).to have_current_path(chef_ingredients_path(@masaharu))
  end
end
