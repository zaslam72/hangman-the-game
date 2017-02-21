Rails.application.routes.draw do

  # root page 
  root 'welcome#index'

  # resources 
  resources :games, except: [:index]
  resources :users, except: [:edit, :update]

  # sign up routes
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # log in routes 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # friendship route -- added method
  post '/users/:id/friendship' => 'users#friendship'

  # bandaid route -- added method
  post '/games/:id/bandaid' => 'games#bandaid'

end
