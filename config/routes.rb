Rails.application.routes.draw do
  get 'category/index'
  get 'category/create'
  get 'category/show'
  devise_for :users
  root 'splash_screen#index'
  # get 'splash_screen#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
