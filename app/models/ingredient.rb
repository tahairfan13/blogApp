class Ingredient < ApplicationRecord
validates :name,presence:true,length: {minimum:3,maximum:25}
has_many :recipe_ingredients #has_many will have the attribute 
has_many :recipes ,through: :recipe_ingredients	
end
