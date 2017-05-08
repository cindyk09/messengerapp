Rails.application.routes.draw do
  resources :notifications
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users
  resources :chats do
    resources :messages
  end
  resources :users

  # root 'notifications#index'
  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
