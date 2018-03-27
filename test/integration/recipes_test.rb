require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
  # chef=Chef.new(chefname:"zaheer",email:"zahe@yahoo.com",password:"password",password_confirmation: "password")
  # chef.save
  @chef = Chef.create!(chefname: "mashrur", email: "mashrur@example.com",
                    password: "password", password_confirmation: "password")


	@recipe=Recipe.new(name:"paratha chicked",description:"Create it nice and easy",chef:@chef)
	@recipe2=Recipe.new(name:"paratha rool",description:"Create it nicesy",chef:@chef)
	@recipe.save
	@recipe2.save
  end	


#problem not able to identify(GRAVATAR)
 # test "should get recipes index" do
 # 	get recipes_path
 # 	assert_response :success #Imp should be exactly the same success
 #  end

 # test "should get recipes listing" do #methood to check whater their is any recipe in DB or not
 #  	get recipes_path
 # 	  assert_template 'recipes/index' #TO use this methood now we need...Add the following gem to your group :development, :test in the gemfile: gem 'rails-controller-testing'
 # 	  assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name  #it checks the link that whater it is sending the correct link
 #    assert_select "a[href=?]", recipe_path(@recipe2), text: @recipe2.name
 # end
 



  test "should get recipe show" do
    get recipe_path(@recipe)
    assert_template 'recipes/show'
 #  assert_match @recipe.name.capatalize,response.body
    assert_match @recipe.description, response.body
    assert_match @recipe.chef.chefname,response.body #means in the body of 'recipes/show' and look for response.body
  end

  test "create new valid recipe" do #methood will check that will the data successfully saves to the 
    get new_recipe_path
    assert_template 'recipes/new'
    name_of_recipe = "chicken saute"
    description_of_recipe = "add chicken, add vegetables, cook for 20 minutes, serve delicious meal"
    assert_difference 'Recipe.count', 1 do
    post recipes_path, params: { recipe: { name: name_of_recipe,description: description_of_recipe}}
    end
  end 

  test "reject invalid recipe submissions" do
  get new_recipe_path
  assert_template 'recipes/new'
  assert_no_difference 'Recipe.count' do #methood to check that is their a change in the database or not
    post recipes_path, params: { recipe: { name: " ", description: " " } }
  end
  assert_template 'recipes/new'
  assert_select 'h2.panel-title' #will check for errors in the bootstrap classes
end

# FOR EDIT

  test "reject invalid recipe update" do
  get edit_recipe_path(@recipe)
  assert_template 'recipes/edit'
  patch recipe_path(@recipe), params: { recipe: { name: " ", description: "some description" } } 
  assert_template 'recipes/edit'
  assert_select 'h2.panel-title' 
  end

# FOR DELETE

#   test "should get recipes show" do
#   get recipe_path(@recipe)
#   assert_template 'recipes/show'
#   assert_match @recipe.name, response.body
#   assert_match @recipe.description, response.body
#   assert_match @chef.chefname, response.body
#   # assert_select 'a[href=?]', edit_recipe_path(@recipe), text: "Edit this recipe"
#   # assert_select 'a[href=?]', recipe_path(@recipe), text: "Delete this recipe"
# end



end
