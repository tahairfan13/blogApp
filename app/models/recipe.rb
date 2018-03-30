class Recipe < ApplicationRecord
	validates :name, presence: true, length: {maximum: 50}
	validates :description, presence: true ,length: {minimum:10, maximum: 500}
	validates :chef_id ,presence:true 
	belongs_to :chef
	default_scope -> { order(updated_at: :desc) } #by default the data is displayed in accesnding order(Oldest entry first)
	#MANY TO MANY WITH Ingredients 
	has_many :recipe_ingredients
	has_many :ingredients ,through: :recipe_ingredients 

	has_many :comments , dependent: :destroy #means if Recipe is destroyed,,,destroy the comment as well
end
