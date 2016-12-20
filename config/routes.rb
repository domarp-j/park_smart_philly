Rails.application.routes.draw do

  resources :locations, only: [:new, :create, :show]
  root "locations#new"

end
