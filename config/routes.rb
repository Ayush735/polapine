Rails.application.routes.draw do
  namespace :admin do
    resources :room
  end

  namespace :owner do
    resources :room
  end
  
  namespace :tenant do
    resources :room , only:[:index,:show]
  end
end