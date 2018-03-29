require 'rails_helper'

RSpec.describe API::V1::RegistrationsController, type: :controller do
  describe "GET #sign_up" do
    context 'when user is valid' do
      before do
        post :sign_up, params: { user: attributes_for(:user) }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'created a new user' do
        expect(User.count).to eq 1
      end
    end

    context 'when user is invalid' do
      before do
        post :sign_up, params: { user: attributes_for(:user, email: '', password: '') }
      end

      it 'should return http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'should return errors list' do
        expect(json['errors']).to be_truthy
      end
    end
  end
end
