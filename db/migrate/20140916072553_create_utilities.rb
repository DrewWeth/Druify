class CreateUtilities < ActiveRecord::Migration
  def change
    create_table :utilities do |t|
      t.integer :visits, :default => 1

      t.timestamps
    end
  end
end
