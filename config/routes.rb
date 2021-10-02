Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  resources :stations, only: [:index, :show]
  get "/signup", to: "users#new"
  post "/login", to: "sessions#create"
end
