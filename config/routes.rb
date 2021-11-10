Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  resources :stations, only: [:index, :show]
  get "/sign_up", to: "users#new"
  post "/sign_up", to: "users#create"
  post "/log_in", to: "sessions#create"
  resource :dashboard, only: :show
end
