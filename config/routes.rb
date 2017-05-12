Rails.application.routes.draw do
  resources :notifications
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :sessions, only: [:create, :new, :destroy]
  resources :chats do
    resources :messages
  end
  resources :users

  # root 'notifications#index'
  root 'welcome#index'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
