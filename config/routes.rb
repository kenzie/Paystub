Paystub::Application.routes.draw do

  resource :user
  resources :sessions
  get "sign-out" => "sessions#destroy", :as => "sign_out"
  get "sign-in" => "sessions#new", :as => "sign_in"
  get "sign-up" => "users#new", :as => "sign_up"

  match 'dashboard' => 'dashboard#welcome'

  root :to => 'dashboard#welcome'

end
