class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.datetime :started
      t.string :summary
      t.string :desc
      t.string :img

      t.timestamps
    end
  end
end
