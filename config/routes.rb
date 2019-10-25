Rails.application.routes.draw do
  get '/show', to: 'teams#show'
  root 'splash_screen#join'
  get '/join', to: 'splash_screen#join'
  get '/create', to: 'splash_screen#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teams
end
