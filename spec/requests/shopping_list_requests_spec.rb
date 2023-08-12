require 'rails_helper'

RSpec.describe 'ShoppingLists', type: :request do
  describe 'GET /shopping_list' do
    it 'signs user in and out' do
      user = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
      sign_in user
      get root_path
      expect(response).to render_template('welcome/index')
    end
  end
end
