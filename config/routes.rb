Rails.application.routes.draw do
  resources :progress_bars

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#top'
end
