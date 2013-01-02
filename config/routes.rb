Expenses::Application.routes.draw do
  resources :expenses, except: [:destroy]
  resources :months, except: [:destroy]
  resources :stats, only: [:index]

  root :to => 'stats#index'
end
