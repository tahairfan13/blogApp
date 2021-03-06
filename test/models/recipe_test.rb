require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup  # used to initially set up the model
  	@chef1=Chef.new(chefname:"Ali", email:"ali@gmail.com", password:"password", password_confirmation: "password") #Recipe has a one-to-many relationship with Chef..so chef is necassary for recipe 
  	@chef1.save # saving this is very important as ID will be generated by DB when is sava[Remember ID is imp as it is the F.K in recipe]
  	@recipe=Recipe.new(name:"pasta",description:"make pasta",chef:@chef1)

  end	

 test "recipe should be valid" do
 assert @recipe.valid?
 end

 test "name should be present" do
 @recipe.name="" # here we have unintentionally changed name to be empty so that we check does it understands it(notice the "assert_not")
 assert_not @recipe.valid?
 end

 test "Chef_id must be valid" do
  @recipe.chef_id= nil
  assert_not @recipe.valid?
 end	


 test "description should be present" do
 @recipe.description=""
 assert_not @recipe.valid?
 end	

 test "maximum length for name" do
 @recipe.name = 'a'*51
 assert_not @recipe.valid?
 end

 test "maximum length for description" do
 @recipe.description = 'a'*501
 assert_not @recipe.valid?
 end	

 test "minimum length for description" do
 @recipe.description = 'a'*2
 assert_not @recipe.valid?
 end	

  test "password should be present" do
    @chef1.password  = " "
    assert_not @chef1.valid?
  end
  
  test "password should be atleast 5 character" do
    @chef1.password = "x" * 4
    assert_not @chef1.valid?
  end




#ONE TEST REMAINING TO CHECK CHEF ID

end
