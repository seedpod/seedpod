Seedpod::Application.routes.draw do

  mount RailsAdmin::Engine => '/administration', :as => 'rails_admin'

  devise_for :admins
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  
  resources :users, only: [] do
    resource :subscription, only: [:new] do
      get :confirm
    end
  end
  
  resources :pods do 
    get :getting_started, on: :collection
    get :preview, on: :collection
    get :this_month, on: :collection
    resources :shipments
  end
  
  resources :gift_codes do
    get :confirm
    get :cancel
  end

  post "/webhooks/gocardless" => "subscriptions#gocardless_webhook", as: 'gocardless_webhook'
  
  root to: "pods#index"
end