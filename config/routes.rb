GuessWhoAgain::Application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :members
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :guess_who
  resources :sessions
  resources :users

  root to: 'guess_who#index'

  #match "/auth/:provider/callback" => "sessions#create_from_github"
  #match "/auth/failure" => "sessions#failure_from_github"
end
