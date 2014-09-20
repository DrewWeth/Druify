class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.boolean :archived

      t.timestamps
    end
  end
end
