Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  get 'users/:id/peper', to: 'users#peper'
  resources :timecards, only: [:index, :new, :create, :update, :destroy]
  get 'timecards/search', to: 'timecards#search'
  resources :pepers, only: [:index, :new,  :update, :destroy]
  get 'pepers/create', to: 'pepers#create'
  get 'user/search', to: 'users#search' #なぜかusersはダメ

end
