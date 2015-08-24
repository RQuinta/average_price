Rails.application.routes.draw do

  namespace :api, defaults: {format: :json}, constraints: {format: 'json'} do
    resource :purchased_products, only: [:create, :index]
    resource :base_products, except: [:new, :edit]
  end


end
