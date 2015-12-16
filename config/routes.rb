Rails.application.routes.draw do
  root "homepage#index"
  devise_for :users, controllers: { registrations: "registrations" }

  authenticate :user do
    resources :notes do
      get 'search', on: :collection
      get 'archive', on: :collection
      post 'restore/:id', on: :collection
    end
  end
end
