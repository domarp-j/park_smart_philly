Rails.application.routes.draw do

  root "locations#new"

  resource :session, :only => [:create]
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'

  resources :parking_violations, only: [:create]
  resources :locations, only: [:new, :create, :update, :show]
  resources :users, except: [:index, :destroy]
  resources :activities, only: [:index, :create]
  resources :comments, only: [:create]

end
