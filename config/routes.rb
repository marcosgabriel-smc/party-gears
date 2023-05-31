Rails.application.routes.draw do
  devise_for :users
  root to: "gears#index"

  resources :gears do
    resources :offers, except: :destroy
    resources :profiles, only: :show

    collection do
      get 'categories/:category', to: "gears#categories", as: 'category'
    end

  end

  resources :offers, only: :destroy
  get 'profiles/my_profile', to: 'profiles#my_profile', as: 'my_profile'
end
