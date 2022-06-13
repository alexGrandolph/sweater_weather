Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      get '/backgrounds', to: 'backgrounds#index'

      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#login'

      get '/book-search', to: 'book_search#index'
    end 
  end 
end
