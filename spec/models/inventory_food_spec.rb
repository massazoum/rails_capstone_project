require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  let(:user) { User.create(name: 'John') }
  let(:inventory) { Inventory.create(user:) }
  let(:food) { Food.create(name: 'Cheese') }

  describe 'associations' do
    it 'should belong to an inventory' do
      expect(InventoryFood.reflect_on_association(:inventory).macro).to eq(:belongs_to)
    end

    it 'should belong to a food' do
      expect(InventoryFood.reflect_on_association(:food).macro).to eq(:belongs_to)
    end
  end

  describe 'instance methods' do
    it '#quantity should return the quantity' do
      inventory_food = InventoryFood.new(inventory:, quantity: 100)
      expect(inventory_food.quantity).to eq(100)
    end
  end
end
