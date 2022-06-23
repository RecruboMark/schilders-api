Rails.application.routes.draw do
  resources :paintings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/paintings/:id/file', to: 'paintings#upload_file'
end
