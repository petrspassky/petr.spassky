Rails.application.routes.draw do
  resources :albums, only: :index

  resources :models, only: :index do
    resources :albums, only: :index
  end

  root 'albums#index'
end
