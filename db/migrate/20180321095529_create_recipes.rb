class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :chefname
      t.string :email
      t.timestamps
    end
  end
end
