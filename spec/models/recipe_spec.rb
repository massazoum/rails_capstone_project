require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'Test User') }

  describe 'validations' do
    it 'is valid with a name and cooking_time' do
      recipe = Recipe.new(name: 'Spaghetti Bolognese', cooking_time: 30, user:)
      expect(recipe).to be_valid
    end

    it 'is invalid without a name' do
      recipe = Recipe.new(name: nil, cooking_time: 30, user:)
      expect(recipe).to be_invalid
      expect(recipe.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a cooking_time' do
      recipe = Recipe.new(name: 'Spaghetti Bolognese', cooking_time: nil, user:)
      expect(recipe).to be_invalid
      expect(recipe.errors[:cooking_time]).to include("can't be blank")
    end
  end
end
