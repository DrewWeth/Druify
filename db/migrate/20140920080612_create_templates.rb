class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :bgUrl
      t.string :accentColor
      t.string :headerColor
      t.string :linkColor
      t.string :unvisitedLinkColor
      t.string :darkClassColor

      t.timestamps
    end
  end
end
