Rails.application.routes.draw do
  get 'notebook/my_notes'
  resources :notes
  resources :users
  get 'session/login'
  post 'session/create'
  get 'session/logout'

  root to: 'notebook#my_notes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
