Rails.application.routes.draw do
  get '/teams', to: 'teams#index'
  get '/new', to: 'teams#new'
end
