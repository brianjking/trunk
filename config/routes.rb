Rails.application.routes.draw do
  root "homepage#index"

  if ENV['ENABLE_SIGNUP']
    devise_for :users
  else
    devise_for :users, controllers: { registrations: "registrations" }
  end

  authenticate :user do
    resources :notes do
      get 'search', on: :collection
    end
  end
end
