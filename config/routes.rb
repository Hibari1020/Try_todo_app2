Rails.application.routes.draw do
  root "static_pages#start"
  get  "/signup",  to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,   only: [:create] do
    member do
      post 'update_done'
      post 'update_not_done'
    end
  end
  get "/microposts_done_list", to: "microposts#done_index", as: "done_index"
  resources :relationships,       only: [:create, :destroy]
end
