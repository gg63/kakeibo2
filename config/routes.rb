Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#get "/books", to: "books#index" 
#post "/books", to: "books#create"
#get "/books/new", to: "books#new", as: "new_book"
#get "/books/:id/edit", to: "books#edit", as: "edit_book"
#get "/books/:id", to: "books#show", as: "book"
#patch "/books/:id", to: "books#update"
    resources :books
end
