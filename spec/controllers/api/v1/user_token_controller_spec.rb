require 'rails_helper'

RSpec.describe API::V1::UserTokenController, type: :controller do
  describe "POST #create" do
    context 'when creds are valid' do
      let(:user) { create(:user) }

      before do
        post :create, params: { auth: { email: user.email, password: user.password } }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns a new JWT token' do
        expect(json['jwt']).to be_truthy
      end
    end

    context 'when creds are invalid' do
      let(:user) { create(:user) }

      before do
        post :create, params: { auth: { email: user.email, password: 'InvalidPassword' } }
      end

      it 'should return auth error' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
