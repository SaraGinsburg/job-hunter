Rails.application.routes.draw do
  
  root 'static#home'
  #SESSIONS
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"

  #JOB APPLICATIONS
  get 'applications/:id', to: "job_applications#show", as: "application"
  get '/:username/applications', to: "job_applications#index", as: "applications"
  get '/:username/applications/new', to: "job_applications#new", as: "new_application" #should this rather be /:job_id/apply or something
  post '/:username/applications', to: "job_applications#create"
  get '/applications/:id/edit', to: "job_applications#edit", as: "edit_application"
  patch '/applications/:id', to: "job_applications#new"
  delete '/applications/:id', to: "job_applications#destroy"

  #JOBS
  resources :jobs

  #USERS
  get '/signup', to: 'users#new', as: "new_user"
  get '/:username/edit', to: 'users#edit', as: "edit_user"
  get '/:username', to: 'users#show', as: "user"
  post '/users', to: 'users#create'
  patch '/:username', to: 'users#update'
  delete '/:username', to: 'users#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
