Rails.application.routes.draw do
  resources :acquisitions, only: :create

  root to: 'pages#home'
end
