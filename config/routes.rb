Rails.application.routes.draw do
  resources :lectures
  get 'registration/register'

  resources :courses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
