require 'rails_helper'

describe Food, type: :request do
  describe ' foods route should be available' do
    before(:each) do
      @isabella = User.create!(name: 'Isabella',
                               email: 'me@gmail.com',
                               password: '1234567', password_confirmation: '1234567')
      @shiro = Food.create(name: 'Shiro', measurement: 'KG', price: 45.99)
    end

    it 'should alow users to create foods' do
      sign_in @isabella
      get '/foods'
      expect(response).to be_successful
      expect(response.body).to include('New Food')
    end
  end
end
