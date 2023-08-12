require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    User.new(name: 'Kay', email: 'kay2@gmail.com', password: 'Success')
    Food.new(name: 'Chicken',
             measurement: 'kg',
             price: 45)
  end

  before { subject.save }
  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end
end
