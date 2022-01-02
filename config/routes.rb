Rails.application.routes.draw do
  resources :bachelorettes
  get '/bachelorettes/:id/contestants', to: 'bachelorette_contestants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
