Rails.application.routes.draw do
  root 'homepage#index'

  resources :registrations
  resources :events
  resources :lectures
  resources :courses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
