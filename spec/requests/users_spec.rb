require 'rails_helper'

RSpec.describe  UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      user = User.create(name: 'Test user', email: 'This is a email user.')
      get "/users/#{user.id}/"
      expect(response).to be_successful
    end
  end

 

  describe 'POST #create' do
    it 'create  user data' do
      user_params = { name: 'New user', email: 'This is a email user.' }
      user = User.create(user_params)
      post '/users/',params: { user: user_params }
      expect(response.status).to eq 200
    end  
  end

  

  describe 'PUT #update' do
    it 'update  user data' do
      user_params = { name: 'New user', email: 'This is a email user.' }
      user = User.create(user_params)
      put "/users/#{user.id}/", params: { user: user_params }
      expect(response).to have_http_status(:success)
    end  
  end

  
  

  describe 'GET #destroy' do
    it 'returns a successful response' do
      user = User.create(name: 'jojo', email: 'j@gmail.com')
      delete user_path(user.id)
      expect(response).to be_successful
    end
  end
end