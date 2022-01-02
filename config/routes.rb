Rails.application.routes.draw do
  get '/bachelorettes/:id/contestants', to: 'bachelorette_contestants#index'
  resources :bachelorettes, :contestants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
