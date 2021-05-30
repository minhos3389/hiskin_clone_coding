Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # restful한 코드로 변경
  resources :packs, only: [:index, :show]

  # get "packs" => "packs#index"
  # get "packs/:id" => "packs/show"
  # get 'packs/index'
  # get 'packs/show/:id' => "packs#show"
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
