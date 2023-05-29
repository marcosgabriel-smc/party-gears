Rails.application.routes.draw do
  devise_for :users
  root to: "gears#index"

  resources :gears
end
