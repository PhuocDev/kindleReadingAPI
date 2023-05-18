Rails.application.routes.draw do
  resources :collections
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :books
  resources :users, except: [:new, :edit]
  post '/users/login', to: 'users#login'
  post '/users/signup', to: 'users#create'  # Thêm dòng này để tạo route cho sign up
end
