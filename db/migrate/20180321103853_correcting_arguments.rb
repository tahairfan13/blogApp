class CorrectingArguments < ActiveRecord::Migration[5.1]
  def change # Ran into a error REMEMBER THE CONVERTION TABLE NAME MUST BE PLURAL
  	rename_column :recipes, :chefname , :name
  	rename_column :recipes, :email , :description
  	change_column :recipes, :description , :text

  	rename_column :chefs, :name , :chefname
  	rename_column :chefs, :description , :email
  	change_column :chefs, :email , :string
  end
end
