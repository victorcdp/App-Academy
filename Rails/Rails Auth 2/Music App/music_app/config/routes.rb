Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, except: [:new, :index] do
    resources :tracks, only: [:new]
  end

  resources :tracks, except: [:new, :index]
  resources :notes, only: [:destroy, :create]
end
