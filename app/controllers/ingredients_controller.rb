class IngredientsController < ApplicationController

before_action :require_user, except: [:index,:show]

def new
@ingredient=Ingredient.new
ingredient_authentication

end

def create
@ingredient=Ingredient.new(ingredient_params)	

ingredient_authentication

	if @ingredient.save
		flash[:success]="ingredient successfully added"
		redirect_to ingredient_path(@ingredient)
	else
		flash[:danger]="Could not add ingredient"
		render 'new'
	end	
end


def edit
@ingredient=Ingredient.find(params[:id])

ingredient_authentication	
end

def update
@ingredient=Ingredient.find(params[:id])

ingredient_authentication

	if @ingredient.update(ingredient_params)
		flash[:success]="ingredient successfully updated"
		redirect_to ingredient_path(@ingredient)
	else
		flash[:danger]="Could not update Ingredient"
		render 'edit'
	end

end




def index
@ingredients=Ingredient.paginate(page:params[:page],per_page: 5) #used for pagination
end

def show
@ingredient=Ingredient.find(params[:id])		
end	


private

def ingredient_params #the parametere which are sent by POST 
params.require(:ingredient).permit(:name) #ask
end

def ingredient_authentication

	if !current_user.admin
		flash[:danger]="Only admin can perform this action"
		redirect_to ingredients_path	
	end	



end	



end
