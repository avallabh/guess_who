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
   #, path: 'NAME OF NEW ROUTE'
  resources :sessions
  resources :users

  # namespace :guess_who do
  #   post 'play'
  # end


  root to: 'guess_who#index'

  #match "/auth/:provider/callback" => "sessions#create_from_github"
  #match "/auth/failure" => "sessions#failure_from_github"
end
