Avec::Application.routes.draw do
  root to: 'dashboard#index'

  # sessions
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login' => redirect('/auth/github')
  delete '/logout' => 'sessions#destroy'

  resources :events do
    get :past, on: :collection
    member do
      post :participate
      post :retreat
    end
    resources :comments
  end

  resources :users, only: [:index] do
    get ':nickname' => 'users#show', on: :collection
  end

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
