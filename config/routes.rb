Rails.application.routes.draw do
  resources :line_item_dates
  root "pages#home"
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  resources :quotes


end
