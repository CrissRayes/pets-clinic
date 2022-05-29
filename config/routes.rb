Rails.application.routes.draw do
  resources :clients do
    resources :pets
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "clients#index"
end
