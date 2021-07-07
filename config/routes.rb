Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/vegetables', to: 'vegetables#index'

  get '/vegetables/:id', to: 'vegetables#show'
end
