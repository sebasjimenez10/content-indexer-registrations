Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'sign_up' => 'registrations#sign_up'
      post 'sign_in' => 'user_token#create'
    end
  end
end
