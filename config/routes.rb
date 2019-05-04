Rails.application.routes.draw do
  get '/teams', to: 'teams#index'
  get 'teams/new', to: 'teams#new'
  post '/teams', to: 'teams#create'
  get '/teams/:id', to: 'teams#show'
end
