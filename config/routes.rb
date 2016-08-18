Rails.application.routes.draw do
  get '/employees/:id', to: 'employees#show'
end
