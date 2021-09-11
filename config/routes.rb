Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users

  #exceptで不要なルート設定を外す
  resource :user, except: [:new, :create, :destory]
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
