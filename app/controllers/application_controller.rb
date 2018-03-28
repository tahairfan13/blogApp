class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in? #helper methood are used so that these methoods can be used in Views 


	#below methoods are for authentication ::Refer to Lecture 120
  	def current_user 
  	@current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  	end	
   #||= is ruby way of saying if not present
   # we use ||= so that it is QUERY only one time

    def logged_in?
    !!current_user	
    end	
  #!! will convert every methood into a true or false
  
  	def require_user
  		if !logged_in?
  		flash[:danger]="Must be logged_in to perform this action"
  		redirect_to root_path	
  		end	
	end  

end
