require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  kay = User.new(name: 'Kay', email: 'kay2@gmail.com', password: 'Success')

  recipe = Recipe.new(name: 'spice',
                      preparation_time: '1 hour',
                      cooking_time: '30mins',
                      description: 'Description is here',
                      public: true,
                      user: kay)

  food = Food.new(name: 'Chicken',
                  measurement: 'kg',
                  price: 45)

  subject do
    RecipeFood.new(recipe_id: recipe.id, food_id: food.id, quantity: 5)
  end

  before { subject.save }

  it 'should have a recipe' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a food' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a number' do
    subject.quantity = 'abc'
    expect(subject).to_not be_valid
  end
end
