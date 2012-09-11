Musicmatch::Application.routes.draw do
  root :to => "game#index"
  
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
  
  get '/game' => 'game#index'
  
end
