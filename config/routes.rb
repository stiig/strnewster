Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  root 'main#index'
  with_options concerns: :paginatable do
    resources :main, only: :index, path: ''
    resources :resource, only: :show
  end
end
