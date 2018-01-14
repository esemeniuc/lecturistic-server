Rails.application.routes.draw do
  resources :users
  resources :events
  resources :lectures
  resources :courses
  root 'homepage#index'
  get 'registration/register', to: 'registration#show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
