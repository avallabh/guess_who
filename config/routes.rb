GuessWhoAgain::Application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  #match "/auth/:provider/callback" => "sessions#create_from_github"
  #match "/auth/failure" => "sessions#failure_from_github"
end
