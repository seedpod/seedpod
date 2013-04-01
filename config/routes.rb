Seedpod::Application.routes.draw do
  resources :pods
  
  root to: "pods#index"
end