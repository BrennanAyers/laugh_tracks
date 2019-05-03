Rails.application.routes.draw do
  get '/teams', to: 'teams#index'
  get '/teams?:age', to: 'teams#by_age'
end
