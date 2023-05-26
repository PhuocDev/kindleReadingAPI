Rails.application.routes.draw do
  resources :highlights
  resources :bookmarks
  resources :locations
  resources :books_collections

  resources :books do
    member do
      get 'bookmarks/latest', to: 'books#latest'
      get 'export_pdf', to: 'books#export_pdf'
      get 'deactive', to: 'books#deactive'
      get 'highlights', to: 'books#all_highlights'
    end
  end
  resources :users, except: [:new, :edit] do
    collection do
      post 'login', to: 'users#login'
      post 'signup', to: 'users#create'
    end
  end

  resources :collections do
    member do
      #collections/:id/books
      get 'books', to: 'collections#show_collection_books'
      # đang trong collections thì nên dẫn đến mothod trong collections
      post 'books/:book_id', to: 'collections#add_new_book_to_a_collection'
    end
  end
  # get '/'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :books
  # #get the last page of a book
  # get 'books/:book_id/bookmarks/latest', to: 'books#latest'
  # #export a book to pdf
  # get 'books/:book_id/export_pdf', to: 'books#export_pdf'
  # get 'books/:book_id/deactive', to: 'books#deactive'
  # #get all highlights of a book
  # get 'books/:book_id/highlights', to: 'books#all_highlights'


  # get 'collection/:id/books', to: 'collections#show_collection_books'
  #add new book to a collection
  # post 'collections/:collection_id/books/:book_id', to: 'books_collections#create'

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
