Rails.application.routes.draw do
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