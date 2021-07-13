Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/gardens', to: 'gardens#index'

  get '/gardens/new', to: 'gardens#new'
  post '/gardens', to: 'gardens#create'

  get '/gardens/:id', to: 'gardens#show'
  get '/gardens/:id/vegetables', to: 'gardens#vegetables_index'

  get '/gardens/:id/edit', to: 'gardens#edit'
  patch '/gardens/:id', to: 'gardens#update'

  delete '/gardens/:id', to: 'gardens#destroy'

  get '/vegetables', to: 'vegetables#index'
  get '/vegetables/:id', to: 'vegetables#show'

  get '/gardens/:id/vegetables/new', to: 'vegetables#new'
  post '/gardens/:id/vegetables', to: 'vegetables#create'

  get '/vegetables/:id/edit', to: 'vegetables#edit'
  patch '/vegetables/:id', to: 'vegetables#update'

  delete '/vegetables/:id', to: 'vegetables#destroy'


  get '/directors', to: 'directors#index'
  get '/directors/new', to: 'directors#new'
  post '/directors', to: 'directors#create'
  get '/directors/:id', to: 'directors#show'
  get '/directors/:id/edit', to: 'directors#edit'
  patch '/directors/:id', to: 'directors#update'
  get '/directors/:director_id/movies', to: 'director_movies#index'
  get '/movies', to: 'movies#index'
  get '/directors/:director_id/movies/new', to: 'movies#new'
  post '/directors/:director_id/movies', to: 'movies#create'
  get '/movies/:id', to: 'movies#show'
end
