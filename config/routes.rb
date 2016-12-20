Rails.application.routes.draw do

  resources :locations, only: [:new, :create, :show]

end
