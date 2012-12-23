Expenses::Application.routes.draw do
  resources :expenses, except: [:destroy]
  resources :months, except: [:destroy]

  root :to => 'months#index'
end
