Avec::Application.routes.draw do
  root to: 'dashboard#index'

  # sessions
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login' => redirect('/auth/github')
  delete '/logout' => 'sessions#destroy'

  get '/events/past' => 'events#past'
  resources :events

  get '/profile' => 'profiles#show'
  get '/settings' => 'profiles#edit'
  resource :profile do
    get '/skills' => 'profiles#edit'
  end
  delete '/skill' => 'profiles#destroy'

  get '/forum' => 'forum#index'
  resources :topics do
    resources :posts
  end
end
