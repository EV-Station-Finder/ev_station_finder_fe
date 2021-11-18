Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  resources :stations, only: [:index, :show]
  get "/sign_up", to: "users#new"
  post "/sign_up", to: "users#create"
  post "/log_in", to: "sessions#create"
  delete "/log_out", to: "sessions#destroy"
  resource :dashboard, only: :show
  resource :favorite_stations, only: :create
  get '*path' => redirect('/')
end
