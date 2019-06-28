Rails.application.routes.draw do
  # ORGANIZATIONS
  #resources: organizations
  get '/organizations', to: 'organizations#index'
  get '/organizations/:id', to: 'organizations#show'
  post '/organizations', to: 'organizations#create'
  put '/organizations/:id', to: 'organizations#update'
  delete '/organizations/:id', to: 'organizations#destroy'
  
  # PROJECTS
  #resources: projects
  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show'
  post '/projects', to: 'projects#create'
  put '/projects/:id', to: 'projects#update'
  delete '/projects/:id', to: 'projects#destroy'

  # CLIENTS
  #resources: clients
  get '/clients', to: 'clients#index'
  get '/clients/:id', to: 'clients#show'
  post '/clients', to: 'clients#create'
  put '/clients/:id', to: 'clients#update'
  delete '/clients/:id', to: 'clients#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
