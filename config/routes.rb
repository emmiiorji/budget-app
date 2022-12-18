Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  root 'categories#splash_screen'

  # resources :users, only: %i[show]
  # resources :categories, only: %i[index show new create]do
  #     resources :transacts, only: %i[new create show]
  # end
  
  resources :users, only: [] do
    resources :categories, only: %i[index show new create] do
      resources :transacts, only: %i[new create show]
    end
  end
end
