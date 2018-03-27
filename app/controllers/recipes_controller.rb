class RecipesController < ApplicationController

def index
@recipes=Recipe.all
end

def show
@recipe=Recipe.find(params[:id])	
end

def new
@recipe=Recipe.new
end	

def create #new sends the request to create
@recipe=Recipe.new(recipe_params)
@recipe.chef=Chef.first #this is temorary will be finished when we add login

  if @recipe.save
  	flash[:success]= "Recipe was created suceessfully"
  	redirect_to recipe_path(@recipe)
  else
  	render 'new'
  end	
end

def edit
@recipe=Recipe.find(params[:id])	
end	

def update #update come after edit
@recipe=Recipe.find(params[:id])

	if @recipe.update(recipe_params)
		flash[:success]= "Recipe was updated suceessfully"
		redirect_to recipe_path(@recipe)
	else
		render 'edit'
	end	
end	


#METHOOD TO DELETE THE RECIPE

def destroy
  Recipe.find(params[:id]).destroy
  flash[:success] = "Recipe deleted successfully"
  redirect_to recipes_path

end


private

def recipe_params
params.require(:recipe).permit(:name,:description) #ask
end
	

end
