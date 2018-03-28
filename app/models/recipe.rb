class Recipe < ApplicationRecord
	validates :name, presence: true, length: {maximum: 50}
	validates :description, presence: true ,length: {minimum:10, maximum: 500}
	validates :chef_id ,presence:true 
	belongs_to :chef
	default_scope -> { order(updated_at: :desc) } #by default the data is displayed in accesnding order(Oldest entry first)
end
