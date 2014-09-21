Rails.application.routes.draw do
  root 'welcome#index'
  get '/menu', to: 'menu#index'
  get 'contact_us', to: 'contact_us#index'

  namespace :admin do
    get '/', to: 'dashboard#index'
    resource :session, only: [:new, :create, :destroy]
    resources :menu_items
    resources :categories
    resources :menu_types, only: [:index, :new, :create]
    resources :sizes, only: [:index, :new, :create]
  end
end
