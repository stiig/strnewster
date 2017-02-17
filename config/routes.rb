Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  root 'main#index'
  resources :main, only: :index, concerns: :paginatable, path: ''
  resources :resource, only: :show
end
