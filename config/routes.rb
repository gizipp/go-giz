Rails.application.routes.draw do
  resources :links
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/:slug', to: 'links#show_by_slug', as: :short
  get '*url',   to: 'links#show_by_url', as: :long

  namespace :api do
    namespace :v1 do
      resources :links
    end
  end
end
