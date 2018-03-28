class ChefsController < ApplicationController

before_action :require_user, except: [:index,:show,:new,:create] # performs the action before runing the methood


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
		session[:chef_id]=@chef.id #so that whenever the user is saved..it is logged in
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
#user defined methood to check the authentication
chef_authentcation
end

def update #edit will call the update methood
@chef=Chef.find(params[:id])
#user defined methood to check the authentication
chef_authentcation

	if @chef.update(chef_params)
	flash[:success] ="successfully updated"
	redirect_to @chef #@chef id another way of saying 'show route'
	else
	render 'edit'
	end

end	

def destroy
@chef=Chef.find(params[:id])

if !@chef.admin # we need to make sure we don't delete the admin
 admin_authentication
end

@chef.destroy
flash[:danger]="chef and all associated recipies deleted"
redirect_to chefs_path
end	



private

def chef_params
params.require(:chef).permit(:chefname,:email,:password,:password_confirmation) # :password and :password_conformation are two virtual atrributes
																				#provided by "has_secure_password" in this way we don't need to check wheter 2 passwords are similar or not" 
end	

def chef_authentcation

	if current_user != @chef && !current_user.admin? #current_user.admin?  is used to add the admin functionality...it is boolean
		flash[:danger]="Correct user must be signed in"
		redirect_to chefs_path
	end	
	
end

def admin_authentication

	if logged_in? && !current_user.admin
		flash[:success]="Only admin can perform such an action"
		redirect_to chefs_path
	end	

end	


end
