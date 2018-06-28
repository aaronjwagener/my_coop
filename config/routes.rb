Rails.application.routes.draw do
  root 'static_pages#home'
  get    '/help',      to: 'static_pages#help'
  get    '/about',     to: 'static_pages#about'
  get    '/signup',    to: 'users#new'
  post   '/signup',    to: 'users#create'
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  resources :users do
   member do
     get :joined_coops, :managed_coops
   end
  end
  resources :coops do
    member do
      get :members, :managers
    end
  end
  resources :memberships,          only: [:create, :destroy]
  resources :managements,          only: [:create, :destroy]
end
