class PagesController < ApplicationController


def home
redirect_to recipes_path if logged_in? #logged in is a methood in 'application_controller' which checks is the user logged in or not
end 



end
