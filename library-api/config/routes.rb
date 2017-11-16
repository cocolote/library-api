Rails.application.routes.draw do
  resources :customers
  get '/customers/:id/checkouts', to: 'customers#checkouts'

  resources :products
  get '/products/:id/checkouts', to: 'products#checkouts'
  post '/products/:id/checkouts', to: 'products#new_checkout'

end
