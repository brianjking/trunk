Rails.application.routes.draw do
  root "homepage#index"
  devise_for :users, controllers: { registrations: "registrations" }

  authenticate :user do
    resources :notes do
      get 'search', on: :collection
    end
  end
end
