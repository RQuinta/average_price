Rails.application.routes.draw do

  namespace :api, defaults: {format: :json}, constraints: {format: 'json'} do

    resources :base_products, except: [:new, :edit, :update]
    resources :purchased_products, except: [:new, :edit, :update]
    resources :delayed_jobs, only: [:index]

  end


end
