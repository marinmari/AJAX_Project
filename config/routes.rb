Rails.application.routes.draw do
  root "emails#index"
  resources :tasks
  resources :emails
end
