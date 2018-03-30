class Comment < ApplicationRecord
validates:description,presence:true ,length: {minimum:10,maximum:200}
belongs_to :recipe #belongs to will always be singular
belongs_to :chef
validates :chef_id, presence: true
validates :recipe_id, presence: true

#for this we would need TUME ATTRIBUTE
#default_scope -> { order(updated_at: :desc)} # to display the result in decending order..means latest entry first

end
