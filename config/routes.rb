Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'

  get '/sessions/new', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions/', to: 'sessions#destroy'

  resources :universities, only: %i[show new index create]  do
    resources :reviews, only: %i[show index new edit update create delete]
  end


end
