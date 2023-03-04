Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'movies#index'

  resources :users
  resources :movies do 
    collection do
      get 'top'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :movies do
        collection do
          get 'search_by_imdb_id/:id', to: 'movies#search_by_imdb_id'
        end
      end
    end
  end

end
