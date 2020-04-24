Rails.application.routes.draw do
  root 'home#index', format: false

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/about', to: 'home#about'

  # not sure for this routes, need research
  get '/*url', to: 'links#show', format: false
  # get '/http:/*url', to: 'links#show', format: false
  # get '/https:/*url', to: 'links#show', format: false



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get '/:slug', to: 'links#show_by_slug', as: :short
  # get '*url',   to: 'links#show', as: :long

  # get '/https://*url', to: 'links#show', format: false
  # get "*url*(.:format)", to: 'links#show'
  # get '/https:/:url', to: 'links#show', as: :https
  # get '/http://:url', to: 'links#show', as: :http
end
