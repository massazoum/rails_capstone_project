require 'rails_helper'

RSpec.describe User, type: :model do 

    before :each do 
        @user = User.new(name: 'John', email: 'john@gmail.com', password: 'John@2023', password_confirmation: 'John@2023')
    end 

    context 'Validation tests' do
        it 'validates user' do 
            @user.save
            expect(@user).to be_valid
        end
    end

    context "Associations tests" do 
        it 'has many recipes' do
            user = User.reflect_on_association(:recipes)
            expect(user.macro).to eq :has_many
        end
        it 'has many inventories' do
            user = User.reflect_on_association(:inventories)
            expect(user.macro).to eq :has_many
        end
    end 
end



# require 'rails_helper'

# RSpec.describe User, type: :model do 

#     before :each do 
#         @user = User.new(name: 'John', email: 'john@gmail.com', password: 'John@2023', password_confirmation: 'John@2023')
#     end 

#     context 'Validation tests' do
#         it 'validates user' do 
#             @user.save
#             expect(@user).to be_valid
#         end
#     end

#     context "Associations tests" do 
#         it 'has many food' do
#             user=User.reflect_on_association(:recipes)
#             expect(user.macro).to eq :has_many
#         end
#         it 'has many recipes' do
#             user=User.reflect_on_association(:foods)
#             expect(user.macro).to eq :has_many
#         end
#     end 
# end