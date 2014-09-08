Rails.application.routes.draw do
  root 'welcome#index'
  get '/menu', to: 'menu#index'

  namespace :admin do
    get '/', to: 'dashboard#index'
  end

  resources :menu_items, only: [:new, :create]
  resources :categories, only: [:index, :new, :create]
end
