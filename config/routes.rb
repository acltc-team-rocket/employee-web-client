Rails.application.routes.draw do
  get '/employees', to: 'employees#index'
  get '/employees/new', to: 'employees#new'
  get '/employees/:id', to: 'employees#show'
  post '/employees', to: 'employees#create'
end
