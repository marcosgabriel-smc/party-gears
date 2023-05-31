Rails.application.routes.draw do
  devise_for :users
  root to: "gears#index"

  resources :gears do
    resources :offers, except: :destroy

    collection do
      get 'categories/:category', to: "gears#categories", as: 'category'
    end

  end

  resources :offers, only: :destroy
  resources :profiles, only: :show
end
