Rails.application.routes.draw do
  devise_for :users
  resources :chats do
    resources :messages
  end
  resources :users
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
