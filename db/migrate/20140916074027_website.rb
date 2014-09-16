class Website < ActiveRecord::Migration
  def change
  	add_column :accounts, :host, :string
  end
end
