Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :fantasy_teams do
    member do
      get :for_week
    end
  end
  resources :nfl_teams
  resources :players do
    collection do
      get :active
    end
  end
  resources :games

  root to: 'fantasy_teams#index'
end
