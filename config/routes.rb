GuessWhoAgain::Application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure',            to: 'sessions#failure'

  resources :members do
    resources :identities
  end

  resources :identity_types
  resources :games

  get 'games', to: 'games#index'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :guess_who
  resources :sessions
  resources :users

  root to: 'guess_who#index'
end
