Rails.application.routes.draw do
  devise_for :users
  resources :teams do 
    resources :players
  end
  
  patch 'change_team/:id/new_team/', to: 'players#change_team', as: "change_team" 
  
end
