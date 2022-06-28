Rails.application.routes.draw do
  get '/draw', to: 'welcome#index'
  namespace :api do 
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      get '/backgrounds', to: 'backgrounds#index'

      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#login'
      post '/road_trip', to: 'road_trip#show'

      get '/book-search', to: 'book_search#index'
    end 
  end 
end
