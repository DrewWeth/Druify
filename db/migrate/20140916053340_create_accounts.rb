class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :url
      t.string :desc

      t.timestamps
    end
  end
end
