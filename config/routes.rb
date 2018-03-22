Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#home"
  get "pages/home", to: "pages#home" 

  # Routes for Recipies
  get "recipes" ,to: "recipes#index"
  get "recipe/:id" , to: "recipes#show" ,as: "recipe"  # as: is used to set the path 

end
