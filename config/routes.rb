Rails.application.routes.draw do
  devise_for :users
  root to: "gears#index"

  resources :gears do
    resources :offers, except: :destroy
  end
  resources :offers, only: :destroy
  resources :profiles, only: :show
end
