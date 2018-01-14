Rails.application.routes.draw do
  get 'registration/register'

  resources :courses
  resources :lectures
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
