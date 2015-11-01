Rails.application.routes.draw do
  root "homepage#index"
  devise_for :users

  authenticate :user do
    resources :notes do
      get 'search', on: :collection
    end
  end
end
