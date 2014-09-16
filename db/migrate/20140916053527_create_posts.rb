class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :desc
      t.text :content
      t.string :url
      t.integer :category

      t.timestamps
    end
  end
end
