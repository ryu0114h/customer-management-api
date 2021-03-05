Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  namespace "api" do
    namespace "v1" do
      resources :customers
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
