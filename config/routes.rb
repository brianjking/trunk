Rails.application.routes.draw do
  root "homepage#index"
  devise_for :users

  resources :notes do
    get 'search', on: :collection
  end
end
