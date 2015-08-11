Rails.application.routes.draw do
  root to: "home#index"

  resources :lists do
    resources :tasks
  end
end
