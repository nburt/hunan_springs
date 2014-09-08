Rails.application.routes.draw do
  root 'welcome#index'

  namespace :admin do
    get '/', to: 'dashboard#index'
  end

  resources :menu_items

  get '/menu', to: 'menu#index'
end
