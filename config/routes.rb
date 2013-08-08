Seedpod::Application.routes.draw do

  mount RailsAdmin::Engine => '/administration', :as => 'rails_admin'

  devise_for :admins
  devise_for :users, controllers: { registrations: "registrations" }
  
  resources :users, only: [] do
    resource :subscription, only: [:new] do
      get :confirm
    end
  end
  
  resources :pods do 
    resources :shipments
  end
  
  root to: "pods#index"
end