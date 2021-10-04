Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  resources :stations, only: [:index, :show]
  get "/signup", to: "sign_up#new"
  # post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
end
