Seedpod::Application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :pods do 
    resources :shipments
  end
  
  root to: "pods#index"
end