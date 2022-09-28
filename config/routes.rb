Rails.application.routes.draw do
  resources :calendars
  root 'calendars#index'
  get '/events', to: 'calendars#index'
  resources :events, path: ':id'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
