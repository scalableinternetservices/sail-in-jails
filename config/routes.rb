Rails.application.routes.draw do
  get 'classes/new'
  get '/show', to: 'teams#show'
  root 'splash_screen#join'
  get '/classes', to: 'classes#new'
  get '/create', to: 'splash_screen#create'
  get '/join', to: 'splash_screen#join'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teams
  resources :classes
end
