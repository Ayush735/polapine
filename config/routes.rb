Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', 
  # skip: [:token_validations],
  controller: {
        sessions: 'devise_token_auth/sessions',
        registrations: 'devise_token_auth/registrations',
        omniauth_callbacks: "devise_token_auth/omniauth_callbacks"
      }
  get "auth", to: "auth#is_signed_in?"
  namespace :api do
    namespace :v1 do
      resources :amenities
      resources :bath_types
      resources :expences
      resources :furnishing_types
      resources :polices
      resources :properties
      resources :property_types
      resources :rooms do
        member do
          get 'set_status_open'
          get 'set_status_booked'
        end
      end
      resources :sharing_types
      resources :tenant_types
    end
  end
end