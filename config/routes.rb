Rails.application.routes.draw do
  namespace "api" do
    namespace "v1" do
      resources :reservations
      resources :customers
      resources :staff

      mount_devise_token_auth_for "Staff",
                                  at: "staff_auth",
                                  controllers: {
                                    registrations: "api/v1/staff/registrations",
                                  }
    end
  end
end
