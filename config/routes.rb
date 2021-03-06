Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#home"
  get "pages/home", to: "pages#home" 

  # Routes for Recipies
  # get    "recipes"    ,to: "recipes#index"
  # get    "recipes/new",to: "recipes#new" ,as:"new_recipe" #REMEMBER NEW MUST BE ON TOP of :id as RAILS Follow this hierarcy 
  # post   "recipes"    ,to: "recipes#create"
  # get    "recipes/:id",to: "recipes#show" ,as: "recipe"  # as: is used to set the path

  # get  	 "recipes/:id/edit" ,to: "recipes#edit" ,as: "edit_recipe" 
  # patch  "recipes/:id"      ,to: "recipes#update" #Remember update is called with edit

  # delete "recipes/:id" ,to: "recipes#destroy" ,as: "recipee"


resources :recipes do # bcz we want comments to be created from recipies
    resources :comments, only: [:create]
  end



    get '/signup', to: 'chefs#new'
    resources :chefs, except: [:new] #we don't want "chefs/new" we want /signup so we do like this


    #Routes for login/logout

    get    "/login"  ,to: "sessions#new" #session#new will send a POST request
    post   "/login"  ,to: "sessions#create"
    delete "/logout" ,to: "sessions#destroy" 

    #Routes for login/logout END

    resources :ingredients ,except: [:destroy]

end
