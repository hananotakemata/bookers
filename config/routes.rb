Rails.application.routes.draw do
  get 'books/index'
  get 'books/edit'
  get 'books/show'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/top' => 'homes#top'
  get 'books/:id' => 'books#show' , as: 'book'

  root to: "homes#top"
  resources :books








end
