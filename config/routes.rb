Rails.application.routes.draw do
  resources :contests, only: [:index, :create, :new]

  root to: 'contests#index'
end
