Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :fantasy_teams
  resources :nfl_teams
  resources :players
  resources :games

  root to: 'fantasy_teams#index'
end
