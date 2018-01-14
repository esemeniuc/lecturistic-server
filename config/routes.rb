Rails.application.routes.draw do
  resources :registrations
  resources :events
  resources :lectures
  resources :courses
  resources :users
  root 'homepage#index'

  get 'schedules/:user_name', to: 'schedules#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
