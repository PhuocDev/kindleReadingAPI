Rails.application.routes.draw do
  resources :highlights
  resources :bookmarks
  resources :locations
  resources :books_collections

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :books
  #get the last page of a book
  get 'books/:book_id/bookmarks/latest', to: 'bookmarks#latest'
  #export a book to pdf
  get 'books/:id/export_pdf', to: 'books#export_pdf'
  get 'books/:book_id/deactive', to: 'books#deactive'
  #get all highlights of a book
  get 'books/:book_id/highlights', to: 'highlights#index_of_book'

  resources :users, except: [:new, :edit]
  post '/users/login', to: 'users#login'
  post '/users/signup', to: 'users#create'  # Thêm dòng này để tạo route cho sign up

  resources :collections do
  end
  get 'collection/:collection_id/books', to: 'collections#show_collection_books'
  #add new book to a collection
  post 'collections/:collection_id/books/:book_id', to: 'books_collections#create'

  # resources :bookmarks
  # resources :locations
  # resources :books_collections
  # resources :books do
  #   member do
  #     get :latest, to: 'bookmarks#latest'
  #     get :export_pdf
  #     get :highlights, to: 'highlights#index_of_book'
  #   end
  # end

  # resources :users, except: [:new, :edit] do
  #   collection do
  #     post :login, to: 'users#login'
  #     post :signup, to: 'users#create'
  #   end
  # end

  # resources :collections do
  #   member do
  #     get :books, to: 'collections#show_collection_books'
  #     post 'books/:book_id', to: 'books_collections#create'
  #   end
  # end


end
