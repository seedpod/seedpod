Seedpod::Application.routes.draw do

  mount RailsAdmin::Engine => '/administration', :as => 'rails_admin'

  devise_for :admins
  devise_for :users
  resources :pods do 
    resources :shipments
  end
  
  root to: "pods#index"
end