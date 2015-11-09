class AddCredentialsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_reference :users, :partner, index: true, foreign_key: true
  end
end
