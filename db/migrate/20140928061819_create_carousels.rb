class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :controller_name
      t.string :image_link
      t.string :image_asset_link
      t.string :main_text
      t.string :sub_text

      t.timestamps
    end
  end
end
