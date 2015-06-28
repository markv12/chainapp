Rails.application.routes.draw do
  root 'front_page#index'

  get '/me', to: 'users#show'
  get '/user_graph', to:'users#graph', as: 'user_graph'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'

  post '/chains', to: 'chains#create'
  get  '/chains/checkin/:chain_id/:user_id', to:"chains#check_in", as: 'check_in'
  get  '/chains/delete_chain/:chain_id/:user_id', to:"chains#delete_chain", as: 'delete_chain'


  resources :user_sessions
  get '/logout', to: 'user_sessions#destroy', as: 'destroy_user_session'
end
