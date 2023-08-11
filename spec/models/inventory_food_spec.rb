require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  subject do
    InventoryFood.new(
      inventory:(:inventory),
      food: (:food),
      quantity: 5
    )
  end

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should belong to an inventory' do
    subject.inventory = nil
    expect(subject).to_not be_valid
  end

  it 'should belong to a food' do
    subject.food = nil
    expect(subject).to_not be_valid
  end

  it { should belong_to(:inventory) }
  it { should belong_to(:food) }
end
