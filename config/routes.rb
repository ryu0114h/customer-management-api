Rails.application.routes.draw do
  namespace "api" do
    namespace "v1" do
      resources :reservations
      resources :customers
      mount_devise_token_auth_for "User", at: "user_auth"
      mount_devise_token_auth_for "Staff", at: "staff_auth"
    end
  end
end
