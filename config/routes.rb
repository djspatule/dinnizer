Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes
  resources :guests
  resources :dinners
  get "add_input" => "dinners#add_input"
end
