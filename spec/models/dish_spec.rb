require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many(:dish_ingredients) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  before(:each) do
    @masaharu = Chef.create!(name: 'Masaharu Morimoto')
    @tako = @masaharu.dishes.create!(name: 'Takoyaki', description: 'Quintesential Japanese street food')
    @octopus = Ingredient.create!(name: 'Octopus', calories: 100)
    @batter = Ingredient.create!(name: 'Takoyaki Batter', calories: 200)
    @egg = Ingredient.create!(name: 'Egg', calories: 50)
    @bonito = Ingredient.create!(name: 'Bonito Flakes', calories: 10)

    @tako.ingredients << [@octopus, @batter, @egg]
  end

  describe 'instance methods' do
    it '.total_calories' do
      expect(@tako.total_calories).to eq(350)
    end
  end
end