Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#top'

  get 'users/top', to: 'users#top'
  resources :users 

  get 'rooms/top', to: 'rooms#top'
  get 'rooms/search', to: 'rooms#search'
  resources :rooms    

  resources :reservations do
    collection do
      post 'confirm'
    end
  end

end
