Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/vegetable_gardens', to: 'vegetable_gardens#index'
  get '/vegetable_gardens/new', to: 'vegetable_gardens#new'
  post '/vegetable_gardens', to: 'vegetable_gardens#create'

  get '/vegetable_gardens/:id', to: 'vegetable_gardens#show'

  get '/vegetable_gardens/:id/vegetables', to: 'vegetable_gardens#vegetables_index'

  get '/vegetables', to: 'vegetables#index'

  get '/vegetables/:id', to: 'vegetables#show'

  get '/vegetable_gardens/:id/edit', to: 'vegetable_gardens#edit'
  patch '/vegetable_gardens/:id', to: 'vegetable_gardens#update'

  get '/vegetable_gardens/:id/vegetables/new', to: 'vegetable_gardens#new_vegetable'

  get '/directors', to: 'directors#index'
  get '/directors/:id', to: 'directors#show'
  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'
  get '/directors/:director_id/movies', to: 'director_movies#index'

end
