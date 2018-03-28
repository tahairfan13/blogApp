class SessionsController < ApplicationController

def new

end

def create
chef=Chef.find_by(email:params[:session_request_form][:email])
	if chef && chef.authenticate(params[:session_request_form][:password]) #remember password is encrypted so chef.authenticate() is necessary
		session[:chef_id]=chef.id #you have saved the chef ID in session hash
		flash[:success]="You have sucessfully loged in"
		redirect_to chef_path(chef)
	else
		flash.now[:danger] ="Incorrect login information"
		render 'new'
	end	

end	

def destroy
	session[:chef_id]=nil
	flash[:success]="You have successfully Loged out"
	redirect_to root_path
end	



end
