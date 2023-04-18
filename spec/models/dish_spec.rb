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
    @john = Chef.create!(name: 'John Doe')
    @pasta = @john.dishes.create!(name: 'Spaghetti Bolognese', description: 'Classic Italian pasta dish')
    @tomato = Ingredient.create!(name: 'Tomato', calories: 20)
    @beef = Ingredient.create!(name: 'Beef', calories: 100)
    @spag = Ingredient.create!(name: 'Spaghetti', calories: 200)

    @pasta.ingredients << [@tomato, @beef, @spag]
  end

  describe 'instance methods' do
    it '.total_calories' do
      expect(@pasta.total_calories).to eq(320)
    end
  end
end