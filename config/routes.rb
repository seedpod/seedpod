Seedpod::Application.routes.draw do
  devise_for :users
  resources :pods
  
  root to: "pods#index"
end