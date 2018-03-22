require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
  	chef=Chef.new(chefname:"zaheer",email:"zaheer@yahoo.com")
  	chef.save
	@recipe=Recipe.new(name:"paratha chicked",description:"Create it nice and easy",chef:chef)
	@recipe2=Recipe.new(name:"paratha rool",description:"Create it nicesy",chef:chef)
	@recipe.save
	@recipe2.save
  end	



  test "should get recipes index" do
 	get recipes_path
 	assert_response :success #Imp should be exactly the same success
  end

 test "should get recipes listing" do #methood to check whater their is any recipe in DB or not
  	get recipes_path
 	assert_template 'recipes/index' #TO use this methood now we need...Add the following gem to your group :development, :test in the gemfile: gem 'rails-controller-testing'
 	assert_match @recipe.name, response.body
  	assert_match @recipe2.name, response.body #means in the body of 'recipes/index' and look for response.body
 end


end
