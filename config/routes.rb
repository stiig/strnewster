Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  concern :paginatable_collection do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  concern :paginatable_member do
    get '(page/:page)', action: :show, on: :member, as: ''
  end

  root 'main#index'

  resources :main, only: :index, path: ''
  resources :resources, only: [:index, :show], concerns: :paginatable_member
  resources :feedbacks, only: [:new, :create]

  with_options only: :index do
    resources :news, concerns: :paginatable_collection
    resources :publics
  end

  unless Rails.application.config.consider_all_requests_local
    get '*path', to: 'application#error_404', via: :all
  end

end
