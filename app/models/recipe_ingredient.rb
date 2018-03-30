class RecipeIngredient < ApplicationRecord

belongs_to :recipe
belongs_to :ingredient

#validates :recipe_id ,presence:true #Spent 8 hours ...well logic is simple when creating a recipie we don't have the recipe_ID
validates :ingredient_id ,presence:true

end
