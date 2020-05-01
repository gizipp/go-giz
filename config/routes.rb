Rails.application.routes.draw do
  namespace :admin do
      resources :links

      root to: "links#index"
    end
  root 'home#index', format: false
  get '/about', to: 'home#about'
  get '/*url', to: 'links#show', format: false

  # not sure for this routes, need research
  # get '/:slug', to: 'links#show_by_slug', as: :short
  # get '*url',   to: 'links#show', as: :long
  # get '/https://*url', to: 'links#show', format: false
  # get "*url*(.:format)", to: 'links#show'
  # get '/https:/:url', to: 'links#show', as: :https
  # get '/http://:url', to: 'links#show', as: :http
end
