Rails.application.routes.draw do
  resources :clients do
    resources :pets
  end
  resources :histories
  root "clients#index"
end
