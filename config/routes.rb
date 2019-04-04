Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'


  # get '/merchant/dashboard/:id', to:'merchant/dashboard#show'

  get '/profile', to: 'users#show', as: :profile

  resources :items, only:[:index] do
  end

  namespace :merchant do
    get '/', to: 'dashboard#show', as: :dashboard
    # resources :items, # TODO
  end

  namespace :admin do
    get '/', to: 'dashboard#show', as: :dashboard
    # resources :items, # TODO
  end

  resources :merchants, only:[:index] do
  end

  resources :cart, only:[:index] do
  end

  resources :users, only:[:new, :create] do
  end

end
