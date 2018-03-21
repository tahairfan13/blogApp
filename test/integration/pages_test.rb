require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

 test "should get root" do # will check that is the root route completely set or not
 	get root_url
 	assert_response :success

 end	

test "should get home" do 
	get pages_home_url #Where 'pages' is the controller & 'home' is the action.. or pages/home
	assert_response :success #got an error when write 'sucess' REMEMBER should be exact "success"

end	


end
