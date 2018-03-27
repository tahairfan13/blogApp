class ChefsController < ApplicationController


def index
#@chefs=Chef.all #will display all the data at once 	
@chefs=Chef.paginate(page:params[:page],per_page: 5) #used for pagination
end



def new
@chef=Chef.new	
end

def create #create will automatically be called after new
@chef=Chef.new(chef_params)

	if @chef.save
		flash[:success]="Username added successfully"
		redirect_to chef_path(@chef)
	else
		render 'new'
	end

end	

def show
@chef=Chef.find(params[:id])

end	


def edit
@chef=Chef.find(params[:id])	
end

def update #edit will call the update methood
@chef=Chef.find(params[:id])

	if @chef.update(chef_params)
	flash[:success] ="successfully updated"
	redirect_to @chef #@chef id another way of saying 'show route'
	else
	render 'edit'
	end

end	

private

def chef_params
params.require(:chef).permit(:chefname,:email,:password,:password_confirmation) # :password and :password_conformation are two virtual atrributes
																				#provided by "has_secure_password" in this way we don't need to check wheter 2 passwords are similar or not" 
end	


end
