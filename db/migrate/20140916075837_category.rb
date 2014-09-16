class Category < ActiveRecord::Migration
  def change
  	change_column :posts, :category, :string
  end
end
