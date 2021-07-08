Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/vegetable_gardens', to: 'vegetable_gardens#index'

  get '/vegetable_gardens/:id', to: 'vegetable_gardens#show'

  get '/vegetables', to: 'vegetables#index'

  get '/vegetables/:id', to: 'vegetables#show'

  get '/vegetable_gardens/:vegetable_garden_id/vegetables', to: 'vegetable_gardens#vegetables_index'
end
