Rails.application.routes.draw do
  concern :paginatable_collection do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  concern :paginatable_member do
    get '(page/:page)', action: :show, on: :member, as: ''
  end

  root 'main#index'

  resources :main, only: :index, path: '', concerns: :paginatable_collection
  resources :resource, only: :show, concerns: :paginatable_member
end
