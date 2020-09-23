Rails.application.routes.draw do
  resources :dogs
  resources :employees
  # delete '/employees/:id', to: 'employees#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
