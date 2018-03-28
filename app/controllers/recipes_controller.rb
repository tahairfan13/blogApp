class RecipesController < ApplicationController

  before_action :require_user, except: [:index, :show] # performs the action before runing the methood
  # before_action :check_for_sameUser_Authorization, only: [:edit, :update, :destroy]


def index
#@recipes=Recipe.all #will display all the data at once  
@recipes=Recipe.paginate(page:params[:page],per_page: 5) #used for pagination
end

def show
@recipe=Recipe.find(params[:id])	
end

def new
@recipe=Recipe.new
end	

def create #new sends the request to create
@recipe=Recipe.new(recipe_params)
@recipe.chef=current_user #current_user is a methood in "application_controller" it gives us the logged in user

  if @recipe.save
  	flash[:success]= "Recipe was created suceessfully"
  	redirect_to recipe_path(@recipe)
  else
  	render 'new'
  end	
end

def edit
@recipe=Recipe.find(params[:id])

#user defined methood
check_for_sameUser_Authorization	
end	

def update #update come after edit
@recipe=Recipe.find(params[:id])
#user defined methood
  check_for_sameUser_Authorization

	if @recipe.update(recipe_params)
		flash[:success]= "Recipe was updated suceessfully"
		redirect_to recipe_path(@recipe)
	else
		render 'edit'
	end	
end	


#METHOOD TO DELETE THE RECIPE

def destroy
@recipe= Recipe.find(params[:id])
#user defined methood
check_for_sameUser_Authorization

@recipe.destroy

  flash[:success] = "Recipe deleted successfully"
  redirect_to recipes_path

end


private

def recipe_params
params.require(:recipe).permit(:name,:description) #ask
end

def check_for_sameUser_Authorization
  if current_user!= @recipe.chef
  flash[:danger]= "Correct user must be logged in!"
  redirect_to recipes_path
  end

end
  
end

	

