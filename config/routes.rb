Rails.application.routes.draw do

  resources :parking_violations, only: [:create]
  resources :locations, only: [:new, :create, :update, :show]
  root "locations#new"

end
