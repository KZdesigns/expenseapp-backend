Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :gl_accounts, only: [:index, :show, :create, :update, :destroy]
  resources :transactions, only: [:index, :show, :create, :update, :destroy]
end
