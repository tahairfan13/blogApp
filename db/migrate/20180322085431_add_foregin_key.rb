class AddForeginKey < ActiveRecord::Migration[5.1]
  def change
  	add_column :recipes , :chef_id , :integar
  end
end
