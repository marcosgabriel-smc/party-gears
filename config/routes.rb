Rails.application.routes.draw do
  devise_for :users
  root to: "gears#index"

  resources :gears do
    resources :offers, except: :destroy
  end
end
