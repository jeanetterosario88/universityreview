Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'

  get '/sessions/new', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions/', to: 'sessions#destroy'

  # get '/universities', to: 'universities#index'
  # get 'universities/new', to: 'universities#new'
  # post '/universities', to: 'universities#create'
  # get '/universities/:id', to: 'universities#show'

  resources :universities, only: %i[show index] do
    resources :reviews, only: %i[show index new edit]
  end

  resources :reviews, only: %i[index show new create edit update]

end
