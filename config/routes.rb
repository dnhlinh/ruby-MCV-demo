Rails.application.routes.draw do
  get '/clients', to: 'clients#index'
  get '/clients/:id', to: 'clients#show'
  post '/clients', to: 'clients#create'
  put '/clients/:id', to: 'clients#update'
  delete '/clients/:id', to: 'clients#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
