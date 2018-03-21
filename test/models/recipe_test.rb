require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup  # used to initially set up the model
  	@recipe=Recipe.new(name:"pasta",description:"make pasta")
  end	

 test "recipe should be valid" do
 assert @recipe.valid?
 end

 test "name should be present" do
 @recipe.name="" # here we have unintentionally changed name to be empty so that we check does it understands it(notice the "assert_not")
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

#ONE TEST REMAINING TO CHECK CHEF ID

end
