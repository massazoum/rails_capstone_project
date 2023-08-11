require 'rails_helper'

RSpec.describe Food, type: :model do 
    
    context 'Associations' do
      it 'has many foods' do
         food= Food.reflect_on_association(:user)
        expect(food.macro).to eq :belongs_to
      end
      it 'belongs to a user' do
        food = Food.reflect_on_association(:user)
        expect(food.macro).to eq :belongs_to
      end
    end
end