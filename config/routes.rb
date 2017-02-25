Rails.application.routes.draw do
  root 'static_pages#home'

  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/test' => 'questions#test'
  post '/test' => 'questions#update'
  get '/test/input' => 'questions#new'
  post '/test/input' => 'questions#create'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
