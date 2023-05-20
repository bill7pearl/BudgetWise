require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #index' do
    it 'render categories after signing-in' do
      user = User.create(name: 'John Doe', email: 'user@example.com', password: 'password')
      Category.create(name: 'test', icon: 'test.jpg')
      sign_in user

      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'creates category after signing-in' do
      user = User.create(name: 'John Doe', email: 'user@example.com', password: 'password')
      Category.create(name: 'test', icon: 'test.jpg')
      sign_in user

      get :new

      expect(response).to have_http_status(:success)
    end
  end
end
